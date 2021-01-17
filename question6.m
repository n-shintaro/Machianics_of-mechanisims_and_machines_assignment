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

l_1=1.0;
l_2=2+368/1000;

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
th_1=linspace(0, 3*pi/2,4);
th_2=linspace(0, 2*pi,1000);
size=numel(th_2);
error=1e-2;
Th2=zeros(size,1);
answer=zeros(8,2);
% th_1=(0, pi/2,pi,3*pi/2)


for i=1:4
    for j=1:size
        Th1=th_1(i);
        Th2=th_2(j);
        if abs(l_1.*(1-cos(Th1))+l_2*(-cos(Th1).*cos(Th2)-sin(Th1).*sin(Th2)+cos(Th2)))<error
            plot(th_1(i),Th2,'r+');
            hold on
       end
    end    
end
th_1=linspace(0, 2*pi,1000);
equation=l_1.*(1-cos(th_1))+l_2*(-cos(th_1).*cos(th_2)-sin(th_1).*sin(th_2)+cos(th_2));
fimplicit(equation,th_2,[0 2*pi 0 2*pi])
    %
% th_2=linspace(0, 3*pi/2,4);
% size=numel(th_2);
% Th1_2=zeros(size,1);
% Th2_2=zeros(size,1);
% 
% th_2=(0, pi/2,pi,3*pi/2)




% size=1000;
% th_1=linspace(0, 2*pi,size);
% th_2=linspace(0, 3*pi/2,4);
% 
% error=1e-2;
% for i=1:4
%     Th2_2=th_2(i);
%     for j=1:size
%         if abs(l_1*(1-cos(th_1(j)))+l_2*(-cos(th_1(j)).*cos(Th2_2)-sin(th_1(j)).*sin(Th2_2)+cos(Th2_2)))<error
%             plot(th_1(j),Th2_2,'r+');
%             j
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