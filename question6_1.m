clear all
clf
close all
% each feasible configuration which has either a θ1 value in {0, pi/2, pi, 3pi/2} 
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

%% draw the configuration on the torus

l_1=1.0;
l_2=2+368/1000;

th_1=linspace(0, 3*pi/2,4);
th_2=linspace(0, 2*pi,1000);
size=numel(th_2);
error=1e-2;
Th2=zeros(size,1);
answer=zeros(8,2);
% th_1=(0, pi/2,pi,3*pi/2)

%th_1=linspace(0, 2*pi,1000);
syms th_1 th_2
equation=l_1.*(1-cos(th_1))+l_2*(-cos(th_1).*cos(th_2)-sin(th_1).*sin(th_2)+cos(th_2));
fimplicit(equation,[0 2*pi])
hold on
grid on
figure(1)
th_1=linspace(0, 3*pi/2,4);
th_2=linspace(0, 2*pi,1000);
ans_th_1=zeros(100,1);
ans_th_2=zeros(100,1);
k=1;
for i=1:4
    Th1=th_1(i);
    for j=1:size
        Th2=th_2(j);
        if abs(l_1.*(1-cos(Th1))+l_2*(-cos(Th1).*cos(Th2)-sin(Th1).*sin(Th2)+cos(Th2)))<error
            ans_th_1(k)=th_1(i);
            ans_th_2(k)=th_2(j);
            k=k+1;
        end
    end    
end
plot(ans_th_1,ans_th_2,'r+','DisplayName','cos(3x)');
            
hold off


%% draw feasible soultion on 3D plot
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

size=1000;
error=0.001;

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
            plot3(X,Y,Z,'b+','DisplayName','configuration');
        end
        
    end
end

% draw the feasible configuration on the torus which has either a θ1 value in {0, pi/2, pi, 3pi/2}
X=(l_2+l_1.*cos(ans_th_1)).*cos(ans_th_2);
Y=(l_2+l_1.*cos(ans_th_1)).*sin(ans_th_2);
Z=l_1.*sin(ans_th_1);
plot3(X,Y,Z,'ro','DisplayName','feasible configuration');


%% draw the point (x1, y1, x2, y2) (without theta_1 is not equal to 0)
for i=1000:1006
    if ans_th_1(i)>0.01
        figure(i+2)
        str = {'O_1','O_2','P_2','P_1','O_1'};
        P1=[l_1*cos(ans_th_1(i)),l_1*sin(ans_th_1(i))];
        P2=[l_2*cos(ans_th_2(i)),l_2*sin(ans_th_2(i))];
        p1=[0 l_1 P2(1) P1(1) 0];
        p2=[0 0 P2(2) P1(2) 0];
        plot(p1,p2,'ro');
        hold on
        plot(p1,p2);
        text(p1,p2,str);
        xlim([-3 3])
        ylim([-3 3])
        grid on
        hold off
    end
end
