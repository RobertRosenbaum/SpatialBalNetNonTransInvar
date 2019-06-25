%%% Sin^1 Input

function [s,malphaf,malphae,malphai,v,rBalE,rBalI,rWBalE,rWBalI,rSimE,rSimI,xPlot]=AnisoSin1(T,N)
    Tburn=500;
    dt=.1;

    % Number of exc and inh neurons in network
    Ne=round(.8*N);
    Ni=round(.2*N);
    N=Ne+Ni;
    qe=Ne/N;
    qi=Ni/N;

    % Baseline connection probabilities
    pbar=[.05 .05; .05 .05];

    % Connection weights
    J=[25 -150; 112.5 -250]/sqrt(N);

    % Baseline external input
    FbarE=.06;
    FbarI=.05;

    % Spatial location of E and I cells
    xE=(1/Ne):(1/Ne):1;
    xI=(1/Ni):(1/Ni):1;

    c=0.15;

    % External input to E and I cells
    Fe=FbarE*sin(pi*xE);
    Fi=FbarI*sin(pi*xI);

    Nt=round(T/dt);
    Istim=ones(Nt,1);

    JIstim=[Fe Fi]*sqrt(N);

    % Mean field matrices can be computed
    % from P, J and q
    Q=[qe qi; qe qi];
    Wbar=12*pbar.*(J*sqrt(N)).*Q;

    % Build network connectivity weights
    [Jinds,Jweights,J0]=BuildJs2x2Spatial42618(N,J,12*pbar);

    %%%%%%%%%%%%%%%%%%%%%
    %%% Network simulation %%%
    %%%%%%%%%%%%%%%%%%%%
    %  tic
    % Neuron parameters
    % The code is for an EIF, but params can be made into those for
    % an LIF
    Cm=1; % Cm=taum and gL=1 gives the correct leak
    gL=1/15;
    EL=-72;
    Vth=-15;
    Vre=-72;
    Vlb=-100; % Effectively no lower boundary on voltage
    tauref=1;  
    Iapp=0;    % No external input (put E0 term here to use it)
    DeltaT=1.5;  % This is for EIF, won't matter for LIF
    VT=-60;    % If VT-Vth>>DeltaT, then the EIF is effectively LIF
    a=0;
    b=0;
    tauw=150;

    % Need to store params into a vector with E and I params on each row
    NeuronParams=[Cm gL EL Vth Vre Vlb tauref Iapp DeltaT VT a b tauw;
                  Cm gL EL Vth Vre Vlb tauref Iapp DeltaT VT a b tauw];


    % Vector of neuron types: 0 for exc, 1 for inh.          
    NeuronType=[zeros(1,Ne) ones(1,Ni)];

    % Synaptic timescales
    taue=8;
    taui=4;

    % Random initial voltage s
    V0=rand(N,1)*(Vth-Vre)+Vre;

    % Maximum number of spikes for all neurons
    % in simulation
    maxns=ceil(.1*N*T);

    % Indices of neurons to record currents, voltages
    % Irecord=[5 10];
    nrecord=100;
    nskiprecord=1;
    Irecord=sort([randsample(Ne,nrecord)' randsample(Ni,nrecord)'+Ne]);

    %tic
    [s,X,alphae,alphai,v,w,~,malphaf,malphae,malphai,~,mw]=AdExNetworkSimDeluxe(sum(N),0,NeuronType,T,[],Istim,JIstim,Jinds,Jweights, ...
                                                                 J0,[],[],[],NeuronParams,10,taue,taui, ...
                                                                 V0,dt,maxns,Tburn,[],Irecord,nskiprecord);


    % Get rid of unused parts of s (which have 0 for spike times)
    s=s(:,s(1,:)>0);
    %tSim=toc;
    %disp(sprintf('\nTime for simulation: %.2f sec, with N=%d and T=%d, Xscale=%.1f*Xbar_{fig}',tSim,N,T,Xscale))

    % Compute histogram of average firing rates of all neurons
    AllRates=hist(s(2,s(1,:)>Tburn),1:N)/(T-Tburn);
    %eratesAll=AllRates(1:Ne);
    %iratesAll=AllRates(Ne+1:end);

    % Mean input
    mI=malphaf+malphae+malphai;
    
    % % Firing rates of just the recorded neurons
    % eratesRec=eratesAll(Irecord(1:nrecord));
    % iratesRec=iratesAll(Irecord(nrecord+1:2*nrecord)-Ne);

    %%%%
    %[g,th]=ComputeGains1x1(mI, AllRates(Irecord));
    
    ge=ComputeGains(mI(1:Ne),AllRates(1:Ne));
    gi=ComputeGains(mI(Ne+1:N),AllRates(Ne+1:N));
    
    %[ge,the,gi,thi]=ComputeGains2x2(mI(1:Ne), AllRates(1:Ne),mI(Ne+1:N),AllRates(Ne+1:N));
    
    D=[1/ge 0;0 1/gi];

    % Compute PSPs
    v=GetPSP(Cm,taue,0,J(1,1),gL,EL,100,dt);EEPSP=max(v)-min(v);
    v=GetPSP(Cm,taue,0,J(2,1),gL,EL,100,dt);IEPSP=max(v)-min(v);
    v=GetPSP(Cm,taui,0,J(1,2),gL,EL,100,dt);EIPSP=max(v)-min(v);
    v=GetPSP(Cm,taui,0,J(2,2),gL,EL,100,dt);IIPSP=max(v)-min(v);
    PSPs=[EEPSP EIPSP; IEPSP IIPSP]

    epsilon=1/(sqrt(N));

    % X-values for plotting
    nxPlot=200;
    xPlot=(1:nxPlot)/nxPlot;

    % Baseline external input vector
    FBar=[FbarE;FbarI];

    % Balanced rate
    rBal=-inv(Wbar)*FBar*pi^2*sin(pi*xPlot);

    % Weakly balanced rate
    rWBal=inv(pi^2*epsilon*D-Wbar)*FBar*pi^2*sin(pi*xPlot);

    rBalE=rBal(1,:);
    rBalI=rBal(2,:);

    rWBalE=rWBal(1,:);
    rWBalI=rWBal(2,:);

    rSimE=histc(s(2,s(1,:)>Tburn & s(2,:)<=Ne),round(xPlot*Ne))/((T-Tburn)*(Ne/nxPlot));
    rSimI=histc(s(2,s(1,:)>Tburn & s(2,:)>Ne)-Ne,round(xPlot*Ni))/((T-Tburn)*(Ni/nxPlot));
end
