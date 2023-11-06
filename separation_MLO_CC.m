close all
clc
clear all 
load('D:\Code\CBMIR\code\code_test\Code_marwa\signature2\histog.mat');
sig=histog(:,:);
k=1;
l=1;
for i=1:1130
    
if mod(i,2)==0 
CC_histog(l,:)=sig(i,:);
l=l+1;
else 
MLO_histog(k,:)=sig(i,:);
k=k+1;
end

end    
