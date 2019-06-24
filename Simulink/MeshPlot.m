% filename = 'H1-100Deltaf1.xlsx';
% % filename = 'H1-10001.xlsx';
% A = xlsread(filename);
% load('DeltaF11000.mat')

x = A(:,1) ; y = A(:,2) ; z = A(:,3);

xlin=linspace (min(x), max(x), 33);
ylin=linspace(min(y),max(y), 33);
[X,Y]= meshgrid(xlin,ylin);

Z=griddata(x,y,z,X,Y, 'linear');
mesh(X,Y,Z)
axis tight; hold on
plot3(x,y,z, '.', 'MarkerSize', 15)
%%unstructured 
% dt = delaunayTriangulation(x,y) ;
% tri = dt.ConnectivityList ;
% figure
% trisurf(tri,x,y,z)
rotate3d on;

% scatter3(x,y,z)
title('Delta F1 varying H2 from 500-2000 in steps of 500')
xlabel('H1')
ylabel('PFR1')
zlabel('PFR2')
