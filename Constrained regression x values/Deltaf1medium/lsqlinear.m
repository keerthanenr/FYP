
clear all
close all
clc

%%
load('deltaf1medium.mat')
d=M(:,1);
C=M(:,2:5);
b=d.*-1;
A=C.*-1;
x = lsqlin(C,d,A,b);
