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
th_1=0:2*pi:0.1;
syms th_1 th_2
figure(1)
equation=l_1.*(1-cos(th_1))+l_2*(-cos(th_1).*cos(th_2)-sin(th_1).*sin(th_2)+cos(th_2));
fimplicit(equation,[0 2*pi 0 2*pi])
title('2D plot of C')

%% draw 3D plot
grid on 
% draw the Torus
a=linspace(0, 2*pi,100);
b=linspace(0, 2*pi,100);
[A,B]=meshgrid(a,b); 
figure(2)
x=(l_2+l_1.*cos(A)).*cos(B);
y=(l_2+l_1.*cos(A)).*sin(B);
z=l_1.*sin(A);
surf(x,y,z);
hold on
% draw the configuration on the torus

size=10000;
error=1e-5;

for i=1:size
    th_1=2*pi/size*i;
    for j=1:size
        th_2=2*pi/size*j;
        if abs(l_1*(1-cos(th_1))+l_2*(-cos(th_1).*cos(th_2)-sin(th_1).*sin(th_2)+cos(th_2)))<error
            Th1=th_1;
            Th2=th_2;
            X=(l_2+l_1.*cos(Th1)).*cos(Th2);
            Y=(l_2+l_1.*cos(Th1)).*sin(Th2);
            Z=l_1.*sin(Th1);
            plot3(X,Y,Z,'r+');
        end
        
    end
end


%% additonal exploration

%I try to use the function "vpasolve" 
%but In the case of non-polynomial equations, vpasolve returns the first solution found.
% so I can get all the feasible soultions.

% grid on 
% % draw the Torus
% a=linspace(0, 2*pi,100);
% b=linspace(0, 2*pi,100);
% [A,B]=meshgrid(a,b); 
% figure
% subplot(2,2,1)
% x=(l_2+l_1.*cos(A)).*cos(B);
% y=(l_2+l_1.*cos(A)).*sin(B);
% z=l_1.*sin(A);
% surf(x,y,z);
% hold on
% % draw the configuration on the torus
% th_1=linspace(0, 2*pi,100);
% size=numel(th_1);
% Th1=zeros(size,1);
% Th2=zeros(size,1);
% 
% for i=1:size
%     Th1(i)=th_1(i);
%     equation=l_1.*(1-cos(Th1(i)))+l_2*(-cos(Th1(i)).*cos(th_2)-sin(Th1(i)).*sin(th_2)+cos(th_2))==0;
%     Th2(i)=vpasolve(equation, th_2,[0 2*pi]);
% end
% 
% X=(l_2+l_1.*cos(Th1)).*cos(Th2);
% Y=(l_2+l_1.*cos(Th1)).*sin(Th2);
% Z=l_1.*sin(Th1);
% plot3(X,Y,Z,'r+');
% 
% subplot(2,1,2);
% plot(Th1,Th2,'r+');



