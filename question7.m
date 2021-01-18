clear all
clf
close all

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

%% calculate the sigularity

%options = optimoptions('fsolve','Display','none','PlotFcn',@optimplotfirstorderopt);
% options = optimset('Display','iter');
% fun = @root3d;
% th0 = [0,0];
% th = fsolve(fun,th0,options)
% 
% function F=root3d(th)
%     F(1)=l_1.*(1-cos(th(1)))+l_2*(-cos(th(1)).*cos(th(2))-sin(th(1)).*sin(th(2))+cos(th(2)));
%     F(2)=l_1.*sin(th(1))+l_2*(-sin(th(2)-th(1)));
%     F(3)=-l_2.*sin(th(2))+l_2*(-sin(th(2)-th(1)));
% end

l_1=1.0;
l_2=2+368/1000;

syms th_1 th_2
equation1=l_1.*(1-cos(th_1))+l_2*(-cos(th_1).*cos(th_2)-sin(th_1).*sin(th_2)+cos(th_2));
equation2=l_1.*sin(th_1)+l_2*(-sin(th_2-th_1));
equation3=-l_2.*sin(th_2)+l_2*(sin(th_2-th_1));
figure(1)

fimplicit(equation1,[-pi pi])
hold on
fimplicit(equation2,[-pi pi])
fimplicit(equation3,[-pi pi])
xlabel('theta1')
ylabel('theta2')
legend('(1)','(2)','(3)')
grid on
hold off