

clear
close all

dosave=0;

if(dosave)
    fprintf('\nAre you sure you want to save figures?\nPress Enter for yes, quit script for no.\n\n')
    pause;
end

% By how many bins to coarsify currents
kc=10;

% Line width, font size, point size
lw=2;
fs=26;
pntsz=8;

% Plot colors
Eclr=[.8 .2 .2];
Iclr=[.2 .2 .8];
Fclr=[.2 .8 .2];
Tclr=[0 0 0];

N=5e3;
Ne=round(.8*N);
Ni=round(.2*N);
T=1e3;

[s,malphaf,malphae,malphai,v,~,~,~,~,~,~,~]=AnisoSin1(T,N);

figure
plot(s(1,s(2,:)<=Ne & s(1,:)>5 & s(1,:)<=300),s(2,s(2,:)<=Ne & s(1,:)>5 & s(1,:)<=300)/Ne,'k.','MarkerSize',pntsz)
axis([0 300 0 1])
xlabel('time (ms)')
ylabel(sprintf('neuron location'))
set(gca,'XTick',[0 100 200 300])
set(gca,'YTick',[0 .5 1])
%box off
set(gca,'LineWidth',lw)
set(gca,'FontSize',fs)
temp=get(gcf,'Position');
temp(3:4)=[800 400];
set(gcf,'Position',temp)

if(dosave)
    saveas(gcf,'Raster1','epsc')
end

figure
kc=10;
plot(coarsify((1:Ne)/Ne,kc),coarsify(malphaf(1:Ne),kc),'LineWidth',lw,'Color',Fclr)
hold on
plot(coarsify((1:Ne)/Ne,kc),coarsify(malphae(1:Ne),kc),'LineWidth',lw,'Color',Eclr)
plot(coarsify((1:Ne)/Ne,kc),coarsify(malphai(1:Ne),kc),'LineWidth',lw,'Color',Iclr)
plot(coarsify((1:Ne)/Ne,kc),coarsify(malphaf(1:Ne)+malphae(1:Ne)+malphai(1:Ne),kc),'LineWidth',lw,'Color',Tclr)
xlabel('neuron location')
ylabel(sprintf('input current'))
axis([0 1 -Inf Inf])
set(gca,'XTick',[0 .5 1])
%set(gca,'YTick',[0 25 50])
box off
set(gca,'LineWidth',lw)
set(gca,'FontSize',fs)
temp=get(gcf,'Position');
temp(3:4)=[600 400];
set(gcf,'Position',temp)

if(dosave)
    saveas(gcf,'Currents1','epsc')
end


%%%

[s,malphaf,malphae,malphai,v,~,~,~,~,~,~,~]=AnisoSin2(T,N);

figure
plot(s(1,s(2,:)<=Ne & s(1,:)>5 & s(1,:)<=300),s(2,s(2,:)<=Ne & s(1,:)>5 & s(1,:)<=300)/Ne,'k.','MarkerSize',pntsz)
axis([0 300 0 1])
xlabel('time (ms)')
ylabel(sprintf('neuron location'))
set(gca,'XTick',[0 100 200 300])
set(gca,'YTick',[0 .5 1])
%box off
set(gca,'LineWidth',lw)
set(gca,'FontSize',fs)
temp=get(gcf,'Position');
temp(3:4)=[800 400];
set(gcf,'Position',temp)

if(dosave)
    saveas(gcf,'Raster2','epsc')
end

figure

plot(coarsify((1:Ne)/Ne,kc),coarsify(malphaf(1:Ne),kc),'LineWidth',lw,'Color',Fclr)
hold on
plot(coarsify((1:Ne)/Ne,kc),coarsify(malphae(1:Ne),kc),'LineWidth',lw,'Color',Eclr)
plot(coarsify((1:Ne)/Ne,kc),coarsify(malphai(1:Ne),kc),'LineWidth',lw,'Color',Iclr)
plot(coarsify((1:Ne)/Ne,kc),coarsify(malphaf(1:Ne)+malphae(1:Ne)+malphai(1:Ne),kc),'LineWidth',lw,'Color',Tclr)
xlabel('neuron location')
ylabel(sprintf('input current'))
axis([0 1 -Inf Inf])
set(gca,'XTick',[0 .5 1])
%set(gca,'YTick',[0 25 50])
box off
set(gca,'LineWidth',lw)
set(gca,'FontSize',fs)
temp=get(gcf,'Position');
temp(3:4)=[600 400];
set(gcf,'Position',temp)

if(dosave)
    saveas(gcf,'Currents2','epsc')
end

%%%

[s,malphaf,malphae,malphai,v,~,~,~,~,~,~,~]=AnisoSin4(T,N);

figure
plot(s(1,s(2,:)<=Ne & s(1,:)>5 & s(1,:)<=300),s(2,s(2,:)<=Ne & s(1,:)>5 & s(1,:)<=300)/Ne,'k.','MarkerSize',pntsz)
axis([0 300 0 1])
xlabel('time (ms)')
ylabel(sprintf('neuron location'))
set(gca,'XTick',[0 100 200 300])
set(gca,'YTick',[0 .5 1])
%box off
set(gca,'LineWidth',lw)
set(gca,'FontSize',fs)
temp=get(gcf,'Position');
temp(3:4)=[800 400];
set(gcf,'Position',temp)

if(dosave)
    saveas(gcf,'Raster4','epsc')
end

figure

plot(coarsify((1:Ne)/Ne,kc),coarsify(malphaf(1:Ne),kc),'LineWidth',lw,'Color',Fclr)
hold on
plot(coarsify((1:Ne)/Ne,kc),coarsify(malphae(1:Ne),kc),'LineWidth',lw,'Color',Eclr)
plot(coarsify((1:Ne)/Ne,kc),coarsify(malphai(1:Ne),kc),'LineWidth',lw,'Color',Iclr)
plot(coarsify((1:Ne)/Ne,kc),coarsify(malphaf(1:Ne)+malphae(1:Ne)+malphai(1:Ne),kc),'LineWidth',lw,'Color',Tclr)
xlabel('neuron location')
ylabel(sprintf('input current'))
axis([0 1 -Inf Inf])
set(gca,'XTick',[0 .5 1])
%set(gca,'YTick',[0 25 50])
box off
set(gca,'LineWidth',lw)
set(gca,'FontSize',fs)
temp=get(gcf,'Position');
temp(3:4)=[600 400];
set(gcf,'Position',temp)

if(dosave)
    saveas(gcf,'Currents4','epsc')
end



%%%

[s,malphaf,malphae,malphai,v,~,~,~,~,~,~,~]=AnisoSin0(T,N);

figure
plot(s(1,s(2,:)<=Ne & s(1,:)>5 & s(1,:)<=300),s(2,s(2,:)<=Ne & s(1,:)>5 & s(1,:)<=300)/Ne,'k.','MarkerSize',pntsz)
axis([0 300 0 1])
xlabel('time (ms)')
ylabel(sprintf('neuron location'))
set(gca,'XTick',[0 100 200 300])
set(gca,'YTick',[0 .5 1])
%box off
set(gca,'LineWidth',lw)
set(gca,'FontSize',fs)
temp=get(gcf,'Position');
temp(3:4)=[800 400];
set(gcf,'Position',temp)

if(dosave)
    saveas(gcf,'Raster0','epsc')
end

figure

plot(coarsify((1:Ne)/Ne,kc),coarsify(malphaf(1:Ne),kc),'LineWidth',lw,'Color',Fclr)
hold on
plot(coarsify((1:Ne)/Ne,kc),coarsify(malphae(1:Ne),kc),'LineWidth',lw,'Color',Eclr)
plot(coarsify((1:Ne)/Ne,kc),coarsify(malphai(1:Ne),kc),'LineWidth',lw,'Color',Iclr)
plot(coarsify((1:Ne)/Ne,kc),coarsify(malphaf(1:Ne)+malphae(1:Ne)+malphai(1:Ne),kc),'LineWidth',lw,'Color',Tclr)
xlabel('neuron location')
ylabel(sprintf('input current'))
axis([0 1 -Inf Inf])
set(gca,'XTick',[0 .5 1])
%set(gca,'YTick',[0 25 50])
box off
set(gca,'LineWidth',lw)
set(gca,'FontSize',fs)
temp=get(gcf,'Position');
temp(3:4)=[600 400];
set(gcf,'Position',temp)

if(dosave)
    saveas(gcf,'Currents0','epsc')
end