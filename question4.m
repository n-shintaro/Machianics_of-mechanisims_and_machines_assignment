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

%% draw the graph
l_1=1.0;
l_2=2+368/1000;

t=linspace(-l_2,l_2,100);
y_2=t;
x_2_positive=l_2+sqrt(l_2^2-y_2.^2);
x_2_negative=l_2-sqrt(l_2^2-y_2.^2);
x_1_positive=l_1*(-1+2*x_2_positive.^2./(l_2^2-l_1^2+2*x_2_positive*l_1));
x_1_negative=l_1*(-1+2*x_2_negative.^2./(l_2^2-l_1^2+2*x_2_negative*l_1));
y_1_positive=sqrt(l_1^2-x_1_positive.^2);
y_1_negative=-sqrt(l_1^2-x_1_positive.^2);
plot3(x_1_positive,y_1_positive,y_2,'b');
hold on
plot3(x_1_positive,y_1_negative,y_2,'b');
plot3(x_1_negative,y_1_positive,y_2,'b');
plot3(x_1_negative,y_1_negative,y_2,'b');
hold off
%positive,x_2,y_2_negative,y_1_negative,x_2,y_2_positive,y_1_negative,x_2,y_2_negative,y_1_positive);

title('C_y_2')
xlabel('x_1')
ylabel('y_1')
zlabel('y_2')
ax = gca;
grid on