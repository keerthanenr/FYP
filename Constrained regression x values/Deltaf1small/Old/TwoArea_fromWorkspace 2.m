clear
close all
clc

%%
% Comments:

%The name of the parameters in the simulink model has to be the same as 
% the name of the variables that are being modified in the loop.

%Use the block "to workspace" in Simulink for saving the output of a
%signal. The value will be saved in a variable with the same name as the
%one given to block "to workspace in the Simulink model. For example, in
%this case it's "Delta_f1" and "Delta_f2"

%%
number_areas = 2;
%H = [1/2*4900 1/2*4900]; % Units: MW*s^2
D = [1e-2 1e-2]; % Units 1/Hz
P_D = 35e3*[1/2 1/2]; % Units: MWs
%R = [0.85e3 0.85e3]; % Units: MW
Td = 10; % Units: s
P_loss = 1.8e3; % Units: MW. The model considers the power outage in area 1
X = 25; % Units: ohms. Line reactance
V = 345; % Units: kV (voltage of the transmission line) 

%total_time = 300; % Units: s. Total time of the simulation

%%
% H1=2000;
% H2=5000;
xvals= 500:500:5000;
len_xvals=length(xvals);
yvals= 500:500:5000;
PFR1vals= 1000:500:5000;
PFR2vals= 1000:500:5000;
len_yvals=length(yvals);
len_PFR1=length(PFR1vals);
len_PFR2=length(PFR2vals);
z=zeros(len_xvals,len_yvals);
n=25;
M=cell(n,1);
j=0;
k=0;
for PFR2index=1:len_PFR2
    PFR2=PFR2vals(PFR2index);
    j=j+1;
    for PFR1index= 1:len_PFR1
        PFR1=PFR1vals(PFR1index);
        k=k+1; 
        for xindex=1:len_xvals
            for yindex = 1:len_yvals
                H1=xvals(xindex);
                H2=yvals(yindex);
                sim('TwoArea_fromWorkspace_MaxRamp')  %runs the simulink model
                a(xindex,yindex)= min(Delta_f1);
            end
        end
        M{j,k}=a;
%         surf(xvals,yvals,a)
%         str = sprintf('F1 Nadir- PFR1=%d, PFR2=%d', PFR1, PFR2);
%         title(str)
%         xlabel('H1');
%         ylabel('H2');
%         zlabel('Frequency Nadir Area 1');
    end
end

%nx = length(xvals);
%yvals = 10 : 50;
%ny = length(yvals)
%z = zeros(nx, ny);
%for xidx = 1 : nx
%x = xvals(xidx);
% for yidx = 1 : ny
%    y = yvals(yidx);
%    zetc = fun(x,y);
%    z(xidx, yidx) = zetc(zidx);
%  end
%end


%plot(Delta_f1)
%hold on
%plot(Delta_f2)
                
        
