
clear all
close all
clc

%%
load('deltaf1smallquad.mat')
d=M(:,1);
C=M(:,2:11);
b=d.*-1;
A=C.*-1;
x = lsqlin(C,d,A,b);
