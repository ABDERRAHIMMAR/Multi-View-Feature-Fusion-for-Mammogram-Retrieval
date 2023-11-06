clear all;
close all; 
clc;

load CC_MLO_LBP_MSH; 
load test_CC_MLO_LBP_MSH;
load y_train;
load y_test;
load Y_hat;
PP=zeros(235,1);
RR=zeros(235,1);
Tsim=zeros(1,565);
distance=Y_hat;

%P=zeros(161,1);
%R=zeros(161,1);

MAP1=zeros(1,1);
MAP5=MAP1;
MAP10=MAP1;
MAP20=MAP1;
MAPall=MAP1;
for i=1:123
%      map1=zeros(1,1);
b=i
Tsim=zeros(1,565);
P=zeros(123,1);
R=zeros(123,1);
    map1=zeros(1,1);
    map5=zeros(1,1);
    map10=zeros(1,1);
    map20=zeros(1,1);
    mapall=zeros(1,1);
for g=1:565

% Rm = corrcoef(M,M);



MCC= test_CC_MLO_LBP_MSH_(i,:);
MCCg= CC_MLO_LBP_MSH(g,:); %ge5i achbihom mouch kifkif les signatures
MCC1=MCC';
MCC1g=MCCg';
de = corrcoef(MCC1,MCC1g);
% de= sqrt(sum((MCC1-MCC1g).^2));
Tsim(1,g)=de;

end
%%%%%%%%%%%%%% Ranking of distances %%%%%%%%%%%%%%
[TIN,IN]=sort(Tsim, 'descend');
 

  
k=1;
rank=IN(k,:);
[P,R]=precisionRecall(rank,y_train);
  map1(1,k)=mean(P(1,k));
        map5(1,k)=mean(P(1:5,k));
        map10(1,k)=mean(P(1:10,k));
        map20(1,k)=mean(P(1:20,k));
        mapall(1,k)=mean(P(:,k));
       
        MAP1=MAP1+map1;
        MAP5=MAP5+map5;
        MAP10=MAP10+map10;
        MAP20=MAP20+map20;
        MAPall=MAPall+mapall;
        PP=PP+P;
        RR=RR+R; 
end
PP=PP/123;
RR=RR/123;
MAP1=MAP1/123;
        MAP5=MAP5/123;
        MAP10=MAP10/123;
        MAP20=MAP20/123;
        MAPall=MAPall/123;