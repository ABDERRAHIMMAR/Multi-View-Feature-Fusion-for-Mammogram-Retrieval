clear all;
clear all;
clear all;
close all; 
clc;
load class_ddsm_all;
load class_DDSM;
load signature_f_DDSM; %% siagnhature mte3na hna hga SDDSM1
load Y_testFUM;
load Y_hatD;
load Si;
%class=truthall(1:161);
% group=zeros(161,1);
PP=zeros(9216,1);
RR=zeros(9216,1);
% map5=zeros(1,162);
% map10=zeros(1,161);
%P=zeros(3,1);
%z=zeros(11218,11218);
%R=P;
%signatures_feat1=signatures_feat1(:,:); %%% ahaga nafshom ghir moch nafes l'esm ok
% distance=zeros(11218,1);
Tsim=zeros(1,11218);
MCC=signature_f_DDSM(:,:);
distance=Y_hatD;
%distance=ones(11218,1); % lihna il8alta d
%P=zeros(161,1);
%R=zeros(161,1);

MAP1=zeros(1,1);
MAP5=MAP1;
MAP10=MAP1;
MAP20=MAP1;
MAPall=MAP1;
for i=1:11218
%      map1=zeros(1,1);
b=i
Tsim=zeros(1,11218);
P=zeros(9216,1);
R=zeros(9216,1);
    map1=zeros(1,1);
    map5=zeros(1,1);
    map10=zeros(1,1);
    map20=zeros(1,1);
    mapall=zeros(1,1);
for g=1:11218
if (distance(i,1)==1)
 %1/ Euclidean distance
%% MCC %%%
MCC= signature_f_DDSM(i,:);
MCCg= signature_f_DDSM(g,:); %ge5i achbihom mouch kifkif les signatures
MCC1=MCC';
MCC1g=MCCg';
de= sqrt(sum((MCC1-MCC1g).^2));
Tsim(1,g)=de;
end
if (distance(i,1)==2)
%2/ Manhattan distance

%% MCC %%%
MCC= signature_f_DDSM(i,:);
MCCg= signature_f_DDSM(g,:);
MCC1=MCC';
MCC1g=MCCg'; 
dhat=sum(abs(MCC1-MCC1g));
Tsim(1,g)=dhat;
end
if (distance(i,1)==3)
% 3/ d=MahalanobisDistance(A, B)

%% MCC %%%
MCC= signature_f_DDSM(i,:);
MCCg=signature_f_DDSM(g,:);
MCC1=MCC';
MCC1g=MCCg';
d=MahalanobisDistance(MCC1,MCC1g);
Tsim(1,g)=d;
end
if (distance(i,1)==4)

%4/ Canberra Distance
 
 %% MCC %%%
MCC= signature_f_DDSM(i,:);
MCCg= signature_f_DDSM(g,:);
MCC1=MCC';
MCC1g=MCCg';
dcan=sum(abs(MCC-MCCg)/(abs(MCC)+abs(MCCg)));
Tsim(1,g)=dcan;
end
%if (distance==5)
%5/ Brag  Curtis 
%% MCC %%%
%MCC= signatures_feat1(i,:);
%MCCg= signatures_feat1(g,:);
%MCC1=MCC';
%MCC1g=MCCg';
%dbc= sum((MCC1-MCC1g)./(MCC1+MCC1g));
%Tsim(i,g)=dbc;
%end
if (distance(i,1)==6)
%6/ Chi-Squared

%% MCC %%%
MCC= signature_f_DDSM(i,:);
MCCg= signature_f_DDSM(g,:);
% MCC1=MCC';
% MCC1g=MCCg';
dCS = sum( (MCC-MCCg).^2 / (MCC+MCCg) ) / 2;
Tsim(1,g)=dCS;
end
if(distance(i,1)==8)
%8/Earth Mover's Distance

%% MCC %%%
MCC= signature_f_DDSM(i,:);
MCCg= signature_f_DDSM(g,:);
%MCC1=MCC';
%MCC1g=MCCg';
D = distEmd(MCC,MCCg);
Tsim(1,g)=D;
end  
% normalized mutual information

end
%%%%%%%%%%%%%% Ranking of distances %%%%%%%%%%%%%%
[TIN,IN]=sort(Tsim, 'descend');
 
%ww=class_DDSM(1,161);
% for k=1:7
% rank=IN(i,:);
% %c_Querg=class_DDSM(1,i);
% %[P1(:,i),R1(:,i)]= Precision_Recall(rank,class_DDSM,c_Querg);
% [P(:,i),R(:,i)]=precisionRecall(rank,class_DDSM)
% %map1(1,k)=mean(P(1,k));
% %map5(1,i)=mean(P(1:5,i));
% %map10(1,i)=mean(P(1:10,i));
% %map20(1,k)=mean(P(1:20,k));
% %mapall(1,k)=mean(P(:,k));
% end
   ww=class_ddsm_all(1,i);
k=1;
rank=IN(k,:);
[P,R]=precisionRecall(rank,class_ddsm_all);
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
PP=PP/11218;
RR=RR/11218;
%PP=PP/size(signature_f_DDSM,1); 
%RR=RR/size(signature_f_DDSM,1);
MAP1=MAP1/11218;
        MAP5=MAP5/11218;
        MAP10=MAP10/11218;
        MAP20=MAP20/11218;
        MAPall=MAPall/11218;