%

function [Jinds,Jweights,J0]=BuildJs2x2Spatial42618(N,J,p)
 
Ne=round(.8*N);
Ni=round(.2*N);

% %Kab= # of connections from a 'b' neuron to 'a' neurons
Kee=zeros(Ne,1);
Kei=zeros(Ni,1);

Kie=zeros(Ne,1);
Kii=zeros(Ni,1);

for i=1:Ne
Kee(i)=round((p(1,1)*Ne*.5*((i/Ne)-(i/Ne)^2)));
Kie(i)=round((p(2,1)*Ni*.5*((i/Ne)-(i/Ne)^2)));

end

tKee=sum(Kee);
tKie=sum(Kie);


for i=1:Ni
Kei(i)=round(p(1,2)*Ne*.5*((i/Ni)-(i/Ni)^2));
Kii(i)=round(p(2,2)*Ni*.5*((i/Ni)-(i/Ni)^2));

end

tKei=sum(Kei);
tKii=sum(Kii);

N=Ne+Ni;

% Total number of recurrent connections
Nrec=(tKee+tKie)+(tKei+tKii);

% Create distributions
binsEE=zeros([Ne,1]);
binsIE=zeros([Ni,1]);
binsEI=zeros([Ne,1]);
binsII=zeros([Ni,1]);
% CbinsE=zeros(Ne);
% CbinsI=zeros(Ni);

xE=(1/Ne):(1/Ne):1;
xI=(1/Ni):(1/Ni):1;


% Initialize
J0=zeros(N+1,1);
Jinds=zeros(Nrec,1);
Jweights=zeros(Nrec,1);
ii=0; % Keeps track of the number of connections stored
    
for j=1:Ne
    J0(j)=ii+1;    

    %Post-synaptic 'ee' connections
%     if Kee~=0    
    if Kee(j)~=0
        % Generate distribution
        binsEE(:)=(min(xE(j),xE(:))-xE(j)*xE(:))*(1/Ne);

        % Spatially dependent distribution 
        postinds=randsample(1:Ne,Kee(j),'true',binsEE(:));
        
        % Store indices to postsynaptic cells
        Jinds((ii+1):(ii+Kee(j)))=postinds;
        
        % Store synaptic weights
        Jweights((ii+1):(ii+Kee(j)))=J(1,1);
        
        % Update count of postsynaptic cells
        ii=ii+Kee(j);
    end
    
    %Post-synaptic 'ie' connections  
    if Kie(j)~=0   
        % Generate distribution
        binsIE(:)=(min(xE(j),xI(:))-xE(j)*xI(:))*(1/Ni);
        
        % Choose indices of connections      
        postinds=randsample(1:Ni,Kie(j),'true',binsIE(:));
        % Store indices to postsynaptic cells
        Jinds((ii+1):(ii+Kie(j)))=postinds+Ne;
        
        % Store synaptic weights
        Jweights((ii+1):(ii+Kie(j)))=J(2,1);
        
        % Update count of postsynaptic cells
        ii=ii+Kie(j);
    end

end

% Inhibitory presynaptic neurons
for j=Ne+1:Ne+Ni
    J0(j)=ii+1;

    %Post-synaptic 'ei' connections   
    if Kei(j-Ne)~=0
        %Generate distribution
        
        binsEI(:)=(min(xI(j-Ne),xE(:))-xI(j-Ne)*xE(:))*(1/Ne);
      
        % Spatial distribution
        postinds=randsample(1:Ne,Kei(j-Ne),'true',binsEI(:));
        
        % Store indices to postsynaptic cells
        Jinds((ii+1):(ii+Kei(j-Ne)))=postinds;
        
        % Store synaptic weights
        Jweights((ii+1):(ii+Kei(j-Ne)))=J(1,2);
        
        % Update count of postsynaptic cells
        ii=ii+Kei(j-Ne);
    end
    
    %Post-synaptic 'ii' connections   
    if Kii(j-Ne)~=0
        %Generate distribution
        binsII(:)=(min(xI(j-Ne),xI(:))-xI(j-Ne)*xI(:))*(1/Ni);
     
        %Choose indices 
        postinds=randsample(1:Ni,Kii(j-Ne),'true',binsII(:));
        
        % Store indices to postsynaptic cells
        Jinds((ii+1):(ii+Kii(j-Ne)))=postinds+Ne;
        
        % Store synaptic weights
        Jweights((ii+1):(ii+Kii(j-Ne)))=J(2,2);
        
        % Update count of postsynaptic cells
        ii=ii+Kii(j-Ne);
    end 
end

J0(Ne+Ni+1)=ii+1;
end