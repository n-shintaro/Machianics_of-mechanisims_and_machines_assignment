clear all
%% format of graph
fontsize=14;
set(0, 'defaultUicontrolFontName', 'Times New Roman');
set(groot, 'defaultAxesFontName','Times New Roman');
set(groot, 'defaultTextFontName','Times New Roman');
set(groot, 'defaultUicontrolFontSize', fontsize);
set(groot, 'defaultAxesFontSize', fontsize);
set(groot, 'defaultTextFontSize', fontsize);
set(groot, 'defaultLegendLocation', 'northoutside')
set(groot, 'defaultLegendOrientation', 'horizontal')
set(groot, 'defaultLineLineWidth', 2)
set(groot,'defaultFigureColor','w')
color = [0 0 0;
        0 0 1;
        0 0.5 0;];
style='-|-.|:|--';
set(groot,'DefaultAxesLineStyleOrder',style,'defaultAxesColorOrder',color)

%% draw 2D plot of C
l_1=1.0;
l_2=2+368/1000;
%th_1=1:2*pi:0.1;
syms th_1 th_2
equation=l_1.*(1-cos(th_1))+l_2*(-cos(th_1).*cos(th_2)-sin(th_1).*sin(th_2)+cos(th_2));
fimplicit(equation,[0 2*pi 0 2*pi])
title('2D plot of C')

%% 
grid on 
% draw the Torus
th_1=linspace(0, 2*pi,100);
th_2=linspace(0, 2*pi,100);
[Th1,Th2]=meshgrid(th_1,th_2); 

x=(l_2+l_1.*cos(Th1)).*cos(Th2);y=(l_2+l_1.*cos(Th1)).*sin(Th2);
z=l_1.*sin(Th1);
surf(x,y,z);

% draw the configuration on the torus
th_1

