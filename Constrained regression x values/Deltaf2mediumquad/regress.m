 y = MCopy(:,1);
 X = ones(length(y),3);
 X(:,2:3) = MCopy(:,2:3);
 [B,BINT,R,RINT,STATS] = regress(y,X);
 
 