load("h1+h2deltaf1.mat");
h=A(:,1);
t=A(:,2);
x=[820:5:5020]; %chosen based on range of data for H1+H2 in delta F1

y=8.0818e+06./(x); % PFR>1/(H1+H2)

scatter(h,t)
hold on
p= plot(x,y)
p(1).LineWidth = 2; %change linewidth to obtain different thickness of line
hold off