% function [ge,gi,the,thi,efit,ifit]=ComputeGainsM(alphaf,alphae,alphai,reSim,riSim,Ne,Ni,Nf,T,Tburn);

%Function to compute the gain function of a given subpopulation of neurons
function g=ComputeGains2(mI, r)
  


% Total input currents averaged over time
% mI=alphaf+alphae+alphai;


% Function to fit the f-I curve to
% This should match the function in fe and fi

gA= fittype('(a1*(I-0)).*(I>0)','independent','I');
% Fit the exc f-I curve
Nfit=fit(mI,r',gA,'StartPoint',.001);

% Define a function representing the f-I curve
fN=@(I)((Nfit.a1*(I-0)).*(I>0));

% % Plot the actual versus fit
% figure
% plot(mI,r,'.')
% hold on
% plot(min(mI):.01:max(mI),fN(min(mI):.01:max(mI)))


% Find the I that gives the average rate
I0=fzero(@(I)(fN(I)-mean(r)),0);

% Compute the gain at that I
g=(Nfit.a1);
%th=Nfit.th;
end
