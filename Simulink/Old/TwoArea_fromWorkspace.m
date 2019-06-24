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
P_D = 35e3*[3/4 1/4]; % Units: MW
%R = [0.85e3 0.85e3]; % Units: MW
Td = 10; % Units: s
P_loss = 1.8e3; % Units: MW. The model considers the power outage in area 1
X = 25; % Units: ohms. Line reactance
V = 345; % Units: kV (voltage of the transmission line) 

%total_time = 300; % Units: s. Total time of the simulation

%%
H1=2000;
H2=5000;
PFR1=1000;
PFR2=2000;

sim('TwoArea_fromWorkspace_MaxRamp')  %runs the simulink model
                
                
plot(Delta_f1)
hold on
plot(Delta_f2)
                
                
        