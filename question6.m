clear all
clf
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

%% Q6

% import answer of Q5
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


figure_number=1;

%% each feasible configuration which has either a θ1=0
th_2_q6_0=linspace(-pi, pi,100);
th_1_q6_0=zeros(1,length(th_2_q6_0));

% each feasible configuration which has either a θ1 value in {pi/2, pi, 3pi/2} 
th_1_q6=[pi/2,pi,3*pi/2];
size=length(th_1_q6);
th_2_q6=zeros(1,size);
for i=1:size
    Th1=th_1_q6(i);
    syms Th2
    equation=l_1.*(1-cos(Th1))+l_2*(-cos(Th1).*cos(Th2)-sin(Th1).*sin(Th2)+cos(Th2))==0;
    th_2_q6(i)=vpasolve(equation, Th2,[0 pi]);
end

th_2_q6_2=zeros(1,size);
for i=1:size
    Th1=th_1_q6(i);
    syms Th2
    equation=l_1.*(1-cos(Th1))+l_2*(-cos(Th1).*cos(Th2)-sin(Th1).*sin(Th2)+cos(Th2))==0;
    th_2_q6_2(i)=vpasolve(equation, Th2,[pi 2*pi]);
end


X_q6_0=(l_2+l_1.*cos(th_1_q6_0)).*cos(th_2_q6_0);
Y_q6_0=(l_2+l_1.*cos(th_1_q6_0)).*sin(th_2_q6_0);
Z_q6_0=l_1.*sin(th_1_q6_0);

X_q6=(l_2+l_1.*cos(th_1_q6)).*cos(th_2_q6);
Y_q6=(l_2+l_1.*cos(th_1_q6)).*sin(th_2_q6);
Z_q6=l_1.*sin(th_1_q6);

X_q6_2=(l_2+l_1.*cos(th_1_q6)).*cos(th_2_q6_2);
Y_q6_2=(l_2+l_1.*cos(th_1_q6)).*sin(th_2_q6_2);
Z_q6_2=l_1.*sin(th_1_q6);
% 2D plot

figure(figure_number)
figure_number=figure_number+1;

th_1=0:2*pi:0.1;
syms th_1 th_2
equation=l_1.*(1-cos(th_1))+l_2*(-cos(th_1).*cos(th_2)-sin(th_1).*sin(th_2)+cos(th_2));
fimplicit(equation,[0 2*pi 0 2*pi],'r')
hold on
plot(th_1_q6_0,th_2_q6_0,'bo','MarkerSize',10)
plot(th_1_q6,th_2_q6,'bo','MarkerSize',10)
plot(th_1_q6,th_2_q6_2,'bo','MarkerSize',10)
xlim([0,2*pi])
ylim([0,2*pi])
xlabel('theta_1')
ylabel('theta_2')
grid on

% 3D plot

figure(figure_number)
figure_number=figure_number+1;
plot3(X_0,Y_0,Z_0,'r+');
hold on
plot3(X_positive,Y_positive,Z_positive,'r+');
plot3(X_negative,Y_negative,Z_negative,'r+');
surf(x,y,z);
plot3(X_q6_0,Y_q6_0,Z_q6_0,'bo');
plot3(X_q6,Y_q6,Z_q6,'bo');
plot3(X_q6_2,Y_q6_2,Z_q6_2,'bo');
xlabel('X')
ylabel('Y')
zlabel('Z')
grid on
hold off

for i=1:length(th_1_q6)
        figure(figure_number)
        figure_number=figure_number+1;
        str = {'O_1','O_2','P_2','P_1','O_1'};
        P1=[l_1*cos(th_1_q6(i)),l_1*sin(th_1_q6(i))];
        P2=[l_1+l_2*cos(th_2_q6(i)),l_2*sin(th_2_q6(i))];
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

for i=1:length(th_1_q6)
        figure(figure_number)
        figure_number=figure_number+1;
        str = {'O_1','O_2','P_2','P_1','O_1'};
        P1=[l_1*cos(th_1_q6(i)),l_1*sin(th_1_q6(i))];
        P2=[l_1+l_2*cos(th_2_q6_2(i)),l_2*sin(th_2_q6_2(i))];
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


%% each feasible configuration which has either a θ2 value in {0 pi/2, pi, 3pi/2} 
th_2_q6_3=[pi/2,3*pi/2];
size=length(th_2_q6_3);
th_1_q6_3=zeros(1,size);
% in the case of theta1!=0
for i=1:size
       
    Th2=th_2_q6_3(i);
    th_2_q6_3(i)=Th2;
    syms Th1
    equation=l_1.*(1-cos(Th1))+l_2*(-cos(Th1).*cos(Th2)-sin(Th1).*sin(Th2)+cos(Th2))==0;
    th_1_q6_3(i)=vpasolve(equation, Th1,[0.1,2*pi-0.1],'Random',true);
end

% in the case of theta1=0
th_1_q6_4=[0,0,0,0];
th_2_q6_4=[0,pi/2,3*pi/2,0];

X_q6_3=(l_2+l_1.*cos(th_1_q6_3)).*cos(th_2_q6_3);
Y_q6_3=(l_2+l_1.*cos(th_1_q6_3)).*sin(th_2_q6_3);
Z_q6_3=l_1.*sin(th_1_q6_3);

X_q6_4=(l_2+l_1.*cos(th_1_q6_4)).*cos(th_2_q6_4);
Y_q6_4=(l_2+l_1.*cos(th_1_q6_4)).*sin(th_2_q6_4);
Z_q6_4=l_1.*sin(th_1_q6_4);
% 
% % 2D plot
% 
% 
% 
th_1=-pi:pi:0.1;
syms th_1 th_2
equation=l_1.*(1-cos(th_1))+l_2*(-cos(th_1).*cos(th_2)-sin(th_1).*sin(th_2)+cos(th_2));
figure(figure_number)
figure_number=figure_number+1;

fimplicit(equation,[0 2*pi 0 2*pi],'r')
hold on
plot(th_1_q6_3,th_2_q6_3,'bo','MarkerSize',10)
plot(th_1_q6_4,th_2_q6_4,'bo','MarkerSize',10)
xlim([0,2*pi])
ylim([0,2*pi])
xlabel('theta_1')
ylabel('theta_2')
grid on

hold off
% 
% 
% % 3D plot
% 
figure(figure_number)
figure_number=figure_number+1;
plot3(X_0,Y_0,Z_0,'r+');
hold on
plot3(X_positive,Y_positive,Z_positive,'r+');
plot3(X_negative,Y_negative,Z_negative,'r+');
surf(x,y,z);
plot3(X_q6_3,Y_q6_3,Z_q6_3,'bo');
plot3(X_q6_4,Y_q6_4,Z_q6_4,'bo');
xlabel('X')
ylabel('Y')
zlabel('Z')
grid on
hold off


% draw the configuration
for i=1:length(th_1_q6_3)
        figure(figure_number)
        figure_number=figure_number+1;
        str = {'O_1','O_2','P_2','P_1','O_1'};
        P1=[l_1*cos(th_1_q6_3(i)),l_1*sin(th_1_q6_3(i))];
        P2=[l_1+l_2*cos(th_2_q6_3(i)),l_2*sin(th_2_q6_3(i))];
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

for i=1:length(th_1_q6_4)
        figure(figure_number)
        figure_number=figure_number+1;
        str = {'O_1','O_2','P_2','P_1','O_1'};
        P1=[l_1*cos(th_1_q6_4(i)),l_1*sin(th_1_q6_4(i))];
        P2=[l_1+l_2*cos(th_2_q6_4(i)),l_2*sin(th_2_q6_4(i))];
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