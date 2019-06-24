clear all
close all
clc

%%
load('data1.mat')

%%
H1=1000:1000:4000;
H2=1000:1000:4000;
PFR1=300:200:1.1e3;
PFR2=300:200:1.1e3;

Y1(length(H1)*length(H2)*length(PFR1)*length(PFR2),1) = 0;
Y2(length(H1)*length(H2)*length(PFR1)*length(PFR2),1) = 0;

for i=1:length(H1)
    for j=1:length(H2)
        for k=1:length(PFR1)
            for l=1:length(PFR2)
                if (l==1)&&(k==1)&&(j==1)&&(i==1)
                    X = [H1(i) H2(j) PFR1(k) PFR2(l)];

                    % Nadir:
                    Y1 = -f1_nadir(i,j,k,l);
                    Y2 = -f2_nadir(i,j,k,l);
 
                else      
                    X = [X; H1(i) H2(j) PFR1(k) PFR2(l)];

                    % Nadir:
                    Y1 = [Y1; -f1_nadir(i,j,k,l)];
                    Y2 = [Y2; -f2_nadir(i,j,k,l)];

                end
            end
        end
    end
end




%% Constrained fit:
% Create matrix C:
C(:,2) = ones(size(X,1),1);
C(:,1) = 1./(X(:,1).*X(:,3));
C(:,3) = 1./(X(:,3));
C(:,4) = 1./(X(:,1));
C(:,5) = X(:,1);
C(:,6) = X(:,3);

% 'd' is the vector of target values, 'y'.
d = Y1;

% Set that the fitted polynomial must be above all data points: 
A = -C;
b = -d;

% No equality constraints:
Aeq = [];
beq = [];

p = lsqlin( C, d, A, b, Aeq, beq );




