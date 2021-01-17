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

%% draw the configuration on the torus
clear all


% Th1=pi/0
% Solves a non-polynomial equation.
% %In the case of non-polynomial equations, vpasolve returns the first solution found.
%  Th1_0=0;
%  syms th_2
%  equation=cos(th_2).^2+sin(th_2).^2-1==0;
%  Th2_0=vpasolve(equation, th_2)
% 
% % Th1=pi/2
% Th1_1=pi/2;
% syms th_2
% equation=l_1.*(1-cos(Th1_1))+l_2*(-cos(Th1_1).*cos(th_2)-sin(Th1_1).*sin(th_2)+cos(th_2))==0;
% Th2_1=vpasolve(equation, th_2,[0 2*pi])
% 
% % Th1=pi
% Th1_2=pi;
% syms th_2
% equation=l_1.*(1-cos(Th1_2))+l_2*(-cos(Th1_2).*cos(th_2)-sin(Th1_2).*sin(th_2)+cos(th_2))==0;
% Th2_2=vpasolve(equation, th_2,[0 2*pi])
% 
% % Th1=3*pi/2
% Th1_3=3*pi/2;
% syms th_2
% equation=l_1.*(1-cos(Th1_3))+l_2*(-cos(Th1_3).*cos(th_2)-sin(Th1_3).*sin(th_2)+cos(th_2))==0;
% Th2_3=vpasolve(equation, th_2,[0 2*pi])
% 
% % Th2=0
% Th2_0=0;
% syms th_1
% equation=l_1.*(1-cos(th_1))+l_2*(-cos(th_1).*cos(Th2_0)-sin(th_1).*sin(Th2_0)+cos(Th2_0))==0;
% Th1_0=vpasolve(equation, th_1)
% 
% % Th1=pi/2
% Th2_1=pi/2;
% syms th_1
% equation=l_1.*(1-cos(Th1_1))+l_2*(-cos(Th1_1).*cos(th_2)-sin(Th1_1).*sin(th_2)+cos(th_2))==0;
% Th2_1=vpasolve(equation, th_2,[0 2*pi])
% 
% % Th1=pi
% Th1_2=pi;
% syms th_2
% equation=l_1.*(1-cos(Th1_2))+l_2*(-cos(Th1_2).*cos(th_2)-sin(Th1_2).*sin(th_2)+cos(th_2))==0;
% Th2_2=vpasolve(equation, th_2,[0 2*pi])
% 
% % Th1=3*pi/2
% Th1_3=3*pi/2;
% syms th_2
% equation=l_1.*(1-cos(Th1_3))+l_2*(-cos(Th1_3).*cos(th_2)-sin(Th1_3).*sin(th_2)+cos(th_2))==0;
% Th2_3=vpasolve(equation, th_2,[0 2*pi])
%
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
            plot3(X,Y,Z,'b+');
        end
        
    end
end


X=(l_2+l_1.*cos(ans_th_1)).*cos(ans_th_2);
Y=(l_2+l_1.*cos(ans_th_1)).*sin(ans_th_2);
Z=l_1.*sin(ans_th_1);
plot3(X,Y,Z,'ro');


%% draw the configuration
for i=1:100
    if ans_th_1~=0
        i
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
% size=1000;
% th_1=linspace(0, 2*pi,size);
% th_2=linspace(0, 3*pi/2,4);
% 
% error=1e-2;
% for i=1:4
%     Th2_2=th_2(i);
%     for j=1:size
%         if abs(l_1*(1-cos(th_1(j)))+l_2*(-cos(th_1(j)).*cos(Th2_2)-sin(th_1(j)).*sin(Th2_2)+cos(Th2_2)))<error
%             plot(th_1(j),Th2_2,'b+');
%             hold on
%         end
%     end
% end


% Th1=pi/0
% Solves a non-polynomial equation.
%In the case of non-polynomial equations, vpasolve returns the first solution found.



% X=(l_2+l_1.*cos(Th1)).*cos(Th2);
% Y=(l_2+l_1.*cos(Th1)).*sin(Th2);
% Z=l_1.*sin(Th1);
% plot3(X,Y,Z,'r+');
% 
% subplot(2,1,2);
% plot(Th1,Th2,'r+');