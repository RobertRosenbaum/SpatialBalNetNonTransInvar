
clear
close all

T=1e4;


%%%
N=1e3;
ntrials=4e5/N;

tic
parfor ii=1:ntrials
    [~,~,~,~,~,rBalEt,rBalIt,rWBalEt,rWBalIt,rSimEt,rSimIt,xPlott]=AnisoSin1(T,N);    
    rSimEs{ii}=rSimEt;
    rSimIs{ii}=rSimIt;
    rBalEs{ii}=rBalEt;
    rBalIs{ii}=rBalIt;
    rWBalEs{ii}=rWBalEt;
    rWBalIs{ii}=rWBalIt;
    xPlots{ii}=xPlott;
    ii
end
t0=toc
save RatesVsX1N1e3nt.mat

clear rSimEs rSimIs rBalEs rBalIs rWBalEs rWBalIs xPlots;

%%%
N=5e3;
ntrials=4e5/N;

tic
parfor ii=1:ntrials
    [~,~,~,~,~,rBalEt,rBalIt,rWBalEt,rWBalIt,rSimEt,rSimIt,xPlott]=AnisoSin1(T,N);    
    rSimEs{ii}=rSimEt;
    rSimIs{ii}=rSimIt;
    rBalEs{ii}=rBalEt;
    rBalIs{ii}=rBalIt;
    rWBalEs{ii}=rWBalEt;
    rWBalIs{ii}=rWBalIt;
    xPlots{ii}=xPlott;
    ii
end
t0=toc
save RatesVsX1N5e3nt.mat

clear rSimEs rSimIs rBalEs rBalIs rWBalEs rWBalIs xPlots;

%%%
N=2e4;
ntrials=4e5/N;

tic
parfor ii=1:ntrials
    [~,~,~,~,~,rBalEt,rBalIt,rWBalEt,rWBalIt,rSimEt,rSimIt,xPlott]=AnisoSin1(T,N);    
    rSimEs{ii}=rSimEt;
    rSimIs{ii}=rSimIt;
    rBalEs{ii}=rBalEt;
    rBalIs{ii}=rBalIt;
    rWBalEs{ii}=rWBalEt;
    rWBalIs{ii}=rWBalIt;
    xPlots{ii}=xPlott;
    ii
end
t0=toc
save RatesVsX1N2e4nt.mat

