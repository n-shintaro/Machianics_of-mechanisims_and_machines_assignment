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

%% Q7


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

%% Q7

% to solve the simultaneous equations
syms th_1 th_2
equation1=l_1.*(1-cos(th_1))+l_2*(-cos(th_1).*cos(th_2)-sin(th_1).*sin(th_2)+cos(th_2));
equation2=l_1.*sin(th_1)+l_2*(-sin(th_2-th_1));
equation3=-l_2.*sin(th_2)+l_2*(sin(th_2-th_1));

figure(figure_number)
figure_number=figure_number+1;

fimplicit(equation1,[-pi pi])
hold on
fimplicit(equation2,[-pi pi])
fimplicit(equation3,[-pi pi])
xlabel('theta1')
ylabel('theta2')
legend('(1)','(2)','(3)')
grid on
hold off



% answer of (a)
th_1_a=[0,0,0];
th_2_a=[0,pi,-pi];


% answer of (b)
th_2_b=linspace(-pi, pi,100);
th_1_b=zeros(1,length(th_2_b));


% answer of (c)
th_1_c=[0,0,0];
th_2_c=[0,pi,-pi];

% draw the answer on 2D plot

figure(figure_number)
figure_number=figure_number+1;

th_1=0:2*pi:0.1;
syms th_1 th_2
equation=l_1.*(1-cos(th_1))+l_2*(-cos(th_1).*cos(th_2)-sin(th_1).*sin(th_2)+cos(th_2));
fimplicit(equation,[-pi pi -pi pi],'r')
hold on
plot(th_1_a,th_2_a,'bo','MarkerSize',10)
plot(th_1_b,th_2_b,'y+','MarkerSize',5)
plot(th_1_c,th_2_c,'go','MarkerSize',15)
xlim([-pi,pi])
ylim([-pi,pi])
xlabel('theta_1')
ylabel('theta_2')
legend('configuration space','(a)','(b)','(c)')
grid on
hold off

%draw the answer on the torus
X_a=(l_2+l_1.*cos(th_1_a)).*cos(th_2_a);
Y_a=(l_2+l_1.*cos(th_1_a)).*sin(th_2_a);
Z_a=l_1.*sin(th_1_a);

X_b=(l_2+l_1.*cos(th_1_b)).*cos(th_2_b);
Y_b=(l_2+l_1.*cos(th_1_b)).*sin(th_2_b);
Z_b=l_1.*sin(th_1_b);

X_c=(l_2+l_1.*cos(th_1_c)).*cos(th_2_c);
Y_c=(l_2+l_1.*cos(th_1_c)).*sin(th_2_c);
Z_c=l_1.*sin(th_1_c);


figure(figure_number)
figure_number=figure_number+1;

plot3(X_0,Y_0,Z_0,'r+');
hold on
plot3(X_positive,Y_positive,Z_positive,'r+');
plot3(X_negative,Y_negative,Z_negative,'r+');
plot3(X_a,Y_a,Z_a,'bo','MarkerSize',10);
plot3(X_b,Y_b,Z_b,'y+','MarkerSize',5);
plot3(X_c,Y_c,Z_c,'go','MarkerSize',15);

surf(x,y,z);
xlabel('x')
ylabel('y')
zlabel('z')

grid on
legend('','','configuration space','(a)','(b)','(c)','torus')
hold off
th_1=[0,0,0];
th_2=[0,-pi,pi];
for i=1:length(th_1)
        figure(figure_number)
        figure_number=figure_number+1;
        str = {'O_1','O_2','P_2','P_1','O_1'};
        P1=[l_1*cos(th_1(i)),l_1*sin(th_1(i))];
        P2=[l_1+l_2*cos(th_2(i)),l_2*sin(th_2(i))];
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
