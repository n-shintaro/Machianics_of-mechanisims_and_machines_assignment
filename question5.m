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


%% Q5 
%In the case of non-polynomial equations, vpasolve returns the first solution found.
% therefore, proof by cases

figure_number=1;
l_1=1.0;
l_2=2+368/1000;
th_2_0=linspace(-pi, pi,100);
size=numel(th_2_0);
Th1=zeros(1,size);
Th2=zeros(1,size);

for i=1:size
    Th2=th_2_0(i);
    syms Th1
    equation=l_1.*(1-cos(Th1))+l_2*(-cos(Th1).*cos(Th2)-sin(Th1).*sin(Th2)+cos(Th2))==0;
    th_1_0(i)=vpasolve(equation, Th1,[-pi pi]);
end

X_0=(l_2+l_1.*cos(th_1_0)).*cos(th_2_0);
Y_0=(l_2+l_1.*cos(th_1_0)).*sin(th_2_0);
Z_0=l_1.*sin(th_1_0);
% 

% subplot(2,1,2);


th_1_positive=linspace(-pi, pi,100);
size=numel(th_1_positive);

for i=1:size
    Th1=th_1_positive(i);
    syms Th2
    equation=l_1.*(1-cos(Th1))+l_2*(-cos(Th1).*cos(Th2)-sin(Th1).*sin(Th2)+cos(Th2))==0;
    th_2_positive(i)=vpasolve(equation, Th2,[0 pi]);
end

X_positive=(l_2+l_1.*cos(th_1_positive)).*cos(th_2_positive);
Y_positive=(l_2+l_1.*cos(th_1_positive)).*sin(th_2_positive);
Z_positive=l_1.*sin(th_1_positive);

th_1_negative=linspace(-pi, pi,100);
size=numel(th_1_negative);

for i=1:size
    Th1=th_1_negative(i);
    syms Th2
    equation=l_1.*(1-cos(Th1))+l_2*(-cos(Th1).*cos(Th2)-sin(Th1).*sin(Th2)+cos(Th2))==0;
    th_2_negative(i)=vpasolve(equation, Th2,[-pi 0]);
end

X_negative=(l_2+l_1.*cos(th_1_negative)).*cos(th_2_negative);
Y_negative=(l_2+l_1.*cos(th_1_negative)).*sin(th_2_negative);
Z_negative=l_1.*sin(th_1_negative);


% calucate the Torus
a=linspace(-pi,pi,100);
b=linspace(-pi, pi,100);
[A,B]=meshgrid(a,b); 
x=(l_2+l_1.*cos(A)).*cos(B);
y=(l_2+l_1.*cos(A)).*sin(B);
z=l_1.*sin(A);

%draw the graph
figure(figure_number)
figure_number=figure_number+1;
th_1=0:2*pi:0.1;
syms th_1 th_2
equation=l_1.*(1-cos(th_1))+l_2*(-cos(th_1).*cos(th_2)-sin(th_1).*sin(th_2)+cos(th_2));
fimplicit(equation,[-pi pi -pi pi],'r')
title('2D plot of C')
xlabel('theta_1')
ylabel('theta_2')
grid on


%draw the configuration on the torus

figure(figure_number)
figure_number=figure_number+1;
plot3(X_0,Y_0,Z_0,'r+');
hold on
plot3(X_positive,Y_positive,Z_positive,'r+');
plot3(X_negative,Y_negative,Z_negative,'r+');
surf(x,y,z);
xlabel('x')
ylabel('y')
zlabel('z')
grid on
hold off





%% Another soultion of Q5

% %% draw 2D plot of C
% l_1=1.0;
% l_2=2+368/1000;
% th_1_0=0:2*pi:0.1;
% syms th_1 th_2
% figure(1)
% equation=l_1.*(1-cos(th_1_0))+l_2*(-cos(th_1_0).*cos(th_2)-sin(th_1_0).*sin(th_2)+cos(th_2));
% fimplicit(equation,[-pi pi -pi pi])
% title('2D plot of C')
% xlabel('theta_1')
% ylabel('theta_2')
% grid on
% %% draw 3D plot
% grid on 
% % draw the Torus
% a=linspace(0, 2*pi,100);
% b=linspace(0, 2*pi,100);
% [A,B]=meshgrid(a,b); 
% figure(2)
% x=(l_2+l_1.*cos(A)).*cos(B);
% y=(l_2+l_1.*cos(A)).*sin(B);
% z=l_1.*sin(A);
% surf(x,y,z);
% xlabel('x')
% ylabel('y')
% ylabel('z')
% hold on
% % draw the configuration on the torus
% 
% size=10000;
% error=1e-5;
% 
% for i=1:size
%     th_1_0=2*pi/size*i;
%     for j=1:size
%         th_2=2*pi/size*j;
%         if abs(l_1*(1-cos(th_1_0))+l_2*(-cos(th_1_0).*cos(th_2)-sin(th_1_0).*sin(th_2)+cos(th_2)))<error
%             Th1=th_1_0;
%             Th2=th_2;
%             X=(l_2+l_1.*cos(Th1)).*cos(Th2);
%             Y=(l_2+l_1.*cos(Th1)).*sin(Th2);
%             Z=l_1.*sin(Th1);
%             plot3(X,Y,Z,'r+');
%         end
%         
%     end
% end

