
clear
close all

% Line width, font size
lw=2;
fs=26;

dosave=0;

if(dosave)
    fprintf('\nAre you sure you want to save figures?\nPress Enter for yes, quit script for no.\n\n')
    pause;
end

% Line colors
Eclr=[.8 .2 .2];
Iclr=[.2 .2 .8];
Eclr1=[.85 .55 .55];
Iclr1=[.55 .55 .85];


load RatesVsX1N1e3nt
figure
plot(xPlots{1},1000*mean(cell2mat(rSimEs')),'Color',Eclr1,'LineWidth',lw)
hold on
plot(xPlots{1},1000*mean(cell2mat(rSimIs')),'Color',Iclr1,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rWBalEs')),'--','Color',Eclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rWBalIs')),'--','Color',Iclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rBalEs')),':','Color',Eclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rBalIs')),':','Color',Iclr,'LineWidth',lw)
%legend('es','is''ew','iw','eb','ib')
%title('X1N5e3')
xlabel('neuron location')
ylabel(sprintf('firing rate (Hz)'))
%title('N=1E3')
axis tight
set(gca,'XTick',[0 .5 1])
set(gca,'YTick',[0 25 50])
box off
set(gca,'LineWidth',lw)
set(gca,'FontSize',fs)
temp=get(gcf,'Position');
temp(3:4)=[570 400]*.9;
set(gcf,'Position',temp)

if(dosave)
    saveas(gcf,'RatesVsX1N1e3','epsc')
end

load RatesVsX1N5e3nt
figure
plot(xPlots{1},1000*mean(cell2mat(rSimEs')),'Color',Eclr1,'LineWidth',lw)
hold on
plot(xPlots{1},1000*mean(cell2mat(rSimIs')),'Color',Iclr1,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rWBalEs')),'--','Color',Eclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rWBalIs')),'--','Color',Iclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rBalEs')),':','Color',Eclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rBalIs')),':','Color',Iclr,'LineWidth',lw)
%legend('es','is''ew','iw','eb','ib')
%title('X1N5e3')
xlabel('neuron location')
ylabel(sprintf(' '))
axis tight
set(gca,'XTick',[0 .5 1])
set(gca,'YTick',[0 25 50])
box off
set(gca,'LineWidth',lw)
set(gca,'FontSize',fs)
temp=get(gcf,'Position');
temp(3:4)=[570 400]*.9;
set(gcf,'Position',temp)

if(dosave)
    saveas(gcf,'RatesVsX1N5e3','epsc')
end



load RatesVsX1N2e4nt
figure
plot(xPlots{1},1000*mean(cell2mat(rSimEs')),'Color',Eclr1,'LineWidth',lw)
hold on
plot(xPlots{1},1000*mean(cell2mat(rSimIs')),'Color',Iclr1,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rWBalEs')),'--','Color',Eclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rWBalIs')),'--','Color',Iclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rBalEs')),':','Color',Eclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rBalIs')),':','Color',Iclr,'LineWidth',lw)
%legend('es','is''ew','iw','eb','ib')
%title('X1N5e3')
xlabel('neuron location')
ylabel(sprintf(' '))
axis tight
set(gca,'XTick',[0 .5 1])
%set(gca,'YTick',[0 25 50])
box off
set(gca,'LineWidth',lw)
set(gca,'FontSize',fs)
temp=get(gcf,'Position');
temp(3:4)=[570 400]*.9;
set(gcf,'Position',temp)

if(dosave)
    saveas(gcf,'RatesVsX1N2e4','epsc')
end



%%%%%

load RatesVsX2N1e3nt
figure
plot(xPlots{1},1000*mean(cell2mat(rSimEs')),'Color',Eclr1,'LineWidth',lw)
hold on
plot(xPlots{1},1000*mean(cell2mat(rSimIs')),'Color',Iclr1,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rWBalEs')),'--','Color',Eclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rWBalIs')),'--','Color',Iclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rBalEs')),':','Color',Eclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rBalIs')),':','Color',Iclr,'LineWidth',lw)
%legend('es','is''ew','iw','eb','ib')
%title('X1N5e3')
xlabel('neuron location')
ylabel(sprintf('firing rate (Hz)'))
axis tight
set(gca,'XTick',[0 .5 1])
set(gca,'YTick',[0 25 50])
box off
set(gca,'LineWidth',lw)
set(gca,'FontSize',fs)
temp=get(gcf,'Position');
temp(3:4)=[570 400]*.9;
set(gcf,'Position',temp)

if(dosave)
    saveas(gcf,'RatesVsX2N1e3','epsc')
end


load RatesVsX2N5e3nt
figure
plot(xPlots{1},1000*mean(cell2mat(rSimEs')),'Color',Eclr1,'LineWidth',lw)
hold on
plot(xPlots{1},1000*mean(cell2mat(rSimIs')),'Color',Iclr1,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rWBalEs')),'--','Color',Eclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rWBalIs')),'--','Color',Iclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rBalEs')),':','Color',Eclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rBalIs')),':','Color',Iclr,'LineWidth',lw)
%legend('es','is''ew','iw','eb','ib')
%title('X1N5e3')
xlabel('neuron location')
ylabel(sprintf(' '))
axis tight
set(gca,'XTick',[0 .5 1])
set(gca,'YTick',[0 25 50])
box off
set(gca,'LineWidth',lw)
set(gca,'FontSize',fs)
temp=get(gcf,'Position');
temp(3:4)=[570 400]*.9;
set(gcf,'Position',temp)


if(dosave)
    saveas(gcf,'RatesVsX2N5e3','epsc')
end


load RatesVsX2N2e4nt
figure
plot(xPlots{1},1000*mean(cell2mat(rSimEs')),'Color',Eclr1,'LineWidth',lw)
hold on
plot(xPlots{1},1000*mean(cell2mat(rSimIs')),'Color',Iclr1,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rWBalEs')),'--','Color',Eclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rWBalIs')),'--','Color',Iclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rBalEs')),':','Color',Eclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rBalIs')),':','Color',Iclr,'LineWidth',lw)
%legend('es','is''ew','iw','eb','ib')
%title('X1N5e3')
xlabel('neuron location')
ylabel(sprintf(' '))
axis tight
set(gca,'XTick',[0 .5 1])
set(gca,'YTick',[0 25 50])
box off
set(gca,'LineWidth',lw)
set(gca,'FontSize',fs)
temp=get(gcf,'Position');
temp(3:4)=[570 400]*.9;
set(gcf,'Position',temp)



if(dosave)
    saveas(gcf,'RatesVsX2N2e4','epsc')
end

%%%%%
load RatesVsX4N1e3nt
figure
plot(xPlots{1},1000*mean(cell2mat(rSimEs')),'Color',Eclr1,'LineWidth',lw)
hold on
plot(xPlots{1},1000*mean(cell2mat(rSimIs')),'Color',Iclr1,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rWBalEs')),'--','Color',Eclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rWBalIs')),'--','Color',Iclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rBalEs')),':','Color',Eclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rBalIs')),':','Color',Iclr,'LineWidth',lw)
%legend('es','is''ew','iw','eb','ib')
%title('X1N5e3')
xlabel('neuron location')
ylabel(sprintf('firing rate (Hz)'))
axis tight
set(gca,'XTick',[0 .5 1])
set(gca,'YTick',[0 25 50])
box off
set(gca,'LineWidth',lw)
set(gca,'FontSize',fs)
temp=get(gcf,'Position');
temp(3:4)=[570 400]*.9;
set(gcf,'Position',temp)


if(dosave)
    saveas(gcf,'RatesVsX4N1e3','epsc')
end


load RatesVsX4N5e3nt
figure
plot(xPlots{1},1000*mean(cell2mat(rSimEs')),'Color',Eclr1,'LineWidth',lw)
hold on
plot(xPlots{1},1000*mean(cell2mat(rSimIs')),'Color',Iclr1,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rWBalEs')),'--','Color',Eclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rWBalIs')),'--','Color',Iclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rBalEs')),':','Color',Eclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rBalIs')),':','Color',Iclr,'LineWidth',lw)
%legend('es','is''ew','iw','eb','ib')
%title('X1N5e3')
xlabel('neuron location')
ylabel(sprintf(' '))
axis tight
set(gca,'XTick',[0 .5 1])
set(gca,'YTick',[0 25 50])
box off
set(gca,'LineWidth',lw)
set(gca,'FontSize',fs)
temp=get(gcf,'Position');
temp(3:4)=[570 400]*.9;
set(gcf,'Position',temp)

if(dosave)
    saveas(gcf,'RatesVsX4N5e3','epsc')
end



load RatesVsX4N2e4nt
figure
plot(xPlots{1},1000*mean(cell2mat(rSimEs')),'Color',Eclr1,'LineWidth',lw)
hold on
plot(xPlots{1},1000*mean(cell2mat(rSimIs')),'Color',Iclr1,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rWBalEs')),'--','Color',Eclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rWBalIs')),'--','Color',Iclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rBalEs')),':','Color',Eclr,'LineWidth',lw)
plot(xPlots{1},1000*mean(cell2mat(rBalIs')),':','Color',Iclr,'LineWidth',lw)
%legend('es','is''ew','iw','eb','ib')
%title('X1N5e3')
xlabel('neuron location')
ylabel(sprintf(' '))
axis tight
set(gca,'XTick',[0 .5 1])
set(gca,'YTick',[0 25 50])
box off
set(gca,'LineWidth',lw)
set(gca,'FontSize',fs)
temp=get(gcf,'Position');
temp(3:4)=[570 400]*.9;
set(gcf,'Position',temp)

if(dosave)
    saveas(gcf,'RatesVsX4N2e4','epsc')
end


