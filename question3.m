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

t=linspace(l_1-l_2,l_1+l_2,100);
x_2=t;
y_2_positive=sqrt(l_2^2-(t-l_1).^2);
y_2_negative=-sqrt(l_2^2-(t-l_1).^2);
x_2_squared=l_2^2-(t-l_1).^2;
x_1=l_1*(-1+2*t.^2./(l_2^2-l_1^2+2*t*l_1));
y_1_positive=sqrt(abs(l_1^2-(x_1).^2));
y_1_negative=-sqrt(abs(l_1^2-(x_1).^2));
plot3(x_2,y_2_positive,y_1_positive,'b',x_2,y_2_negative,y_1_negative,'b',x_2,y_2_positive,y_1_negative,'b',x_2,y_2_negative,y_1_positive,'b');

title('C_y_1')
xlabel('x_2')
ylabel('y_2')
zlabel('y_1')
ax = gca;
grid on