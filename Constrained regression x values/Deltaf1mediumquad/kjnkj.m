

filename = 'H1-10001.xlsx';
A = xlsread(filename);
x = A(:,1) ; y = A(:,2) ; z = A(:,3) ;

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
title('Relationship between H1')
xlabel('H2')
ylabel('PFR1')
zlabel('PFR2')
function myslider
    figure;
    sld = uicontrol('Style', 'slider',...
        'Min',100,'Max',1600,'Value',800,...
        'Units', 'Normalized',...
        'Position', [0.13 0.39  0.77 0.54],...
        'Callback', @print_val,...
        'SliderStep', [100/1500 100]);
end
function print_val(hObject,callbackdata)
    newval = hObject.Value;                         %get value from the slider
    newval = round(newval);                         %round off this value
    set(hObject, 'Value', newval);                  %set slider position to rounded off value
    disp(['Slider moved to ' num2str(newval)]);     %display the value pointed by slider
end

