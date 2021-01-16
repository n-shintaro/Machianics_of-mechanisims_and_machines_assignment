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

syms x_2 y_1 y_2
f=(2*x_2*l_1+l_2.^2-l_1.^2+2*y_1*y_2).^2-4*x_2.^2*(l_1.^2-y_1.^2); 
fimplicit3(f);
title('C_y_1')
xlabel('x_2')
ylabel('y_1')
zlabel('y_2')
ax = gca;