clear
close all
clc

%%
% Comments:

The name of the parameters in the simulink model has to be the same as 
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

%array= minimum_value: step_size: maximum_value
xvals= 500:50:4000;
yvals= 500:50:5000;
PFR1vals= 1000:50:5000;
PFR2vals= 1000:50:3000;

len_xvals=length(xvals);
len_yvals=length(yvals);
len_PFR1=length(PFR1vals);
len_PFR2=length(PFR2vals);
M=zeros(60000,5);
i=2;
k=0;
H2=200;
p=0;
h = waitbar(0,'Initializing waitbar...');
for PFR2index=1:len_PFR2
    PFR2=PFR2vals(PFR2index);
    for PFR1index= 1:len_PFR1
        PFR1=PFR1vals(PFR1index);
            for xindex=1:len_xvals
                H1=xvals(xindex);
                H2=100;
                sim('TwoArea_fromWorkspace_MaxRamp')  %runs the simulink model
                k=min(Delta_f1);
                if k<-0.8
                    while k<-0.8
                        if k<-0.87
                            H2=H2+200;
                        elseif k<-0.81
                            H2=H2+20;
                        else
                            H2=H2+5;
                        end 
                        sim('TwoArea_fromWorkspace_MaxRamp')
                        k=min(Delta_f1);
                    end
                else
                    p=p+1;
                    r=(p/1000);
                    waitbar(r,h, p);
                    break
                end
                p=p+1;
                row=[H1, H2, PFR1, PFR2, k];
                j=i-1;
                M(i,:)=row; 
                if M(i,5)<=-0.8 && M(j,5)<=-50
                    break
                end
                i=i+1;
                r=(p/1000);
                waitbar(r,h, p);
%                 else
%                     a(xindex,yindex)= 0;
%                 end
            end
    end
end
csvwrite('file.csv',M)
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
                
        
