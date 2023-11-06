clear all;
close all; 
clc;
load MSH_Zernike;
load MSH_Zernike;
load Y_zer;
load y_train;
load y_test;
load Y_hmsh;
load test_shearlet_zernike_benigne
load zernike_GLCM2
load test_shearlet_zernike_benigne
load test_shearlet_zernike_benigne
PP=zeros(49,1);
RR=zeros(49,1);

load Y_hatLBPshear
distance=Y_hatLBPshear;

MAP1=zeros(1,1);
MAP5=MAP1;
MAP10=MAP1;
MAP20=MAP1;
MAPall=MAP1;
for i=1:74
%map1=zeros(1,1);
b=i
Tsim=zeros(1,74);
% P=zeros(235,1);
% R=zeros(235,1);
    map1=zeros(1,1);
    map5=zeros(1,1);
    map10=zeros(1,1);
    map20=zeros(1,1);
    mapall=zeros(1,1);
for g=1:74

if (distance(i,1)==1)
 %1/ Euclidean distance
%% MCC %%%
MCC=test_shearlet_zernike_benigne(i,:);
MCCg=test_shearlet_zernike_benigne(g,:); %ge5i achbihom mouch kifkif les signatures
MCC1=MCC';
MCC1g=MCCg';
de= sqrt(sum((MCC1-MCC1g).^2));
Tsim(1,g)=de;
end
if (distance(i,1)==2)
%2/ Manhattan distance

%% MCC %%%
MCC=test_shearlet_zernike_benigne(i,:);
MCCg=test_shearlet_zernike_benigne(g,:);
MCC1=MCC';
MCC1g=MCCg'; 
dhat=sum(abs(MCC1-MCC1g));
Tsim(1,g)=dhat;
end
if (distance(i,1)==3)
% 3/ d=MahalanobisDistance(A, B)

%% MCC %%%
MCC=test_shearlet_zernike_benigne(i,:);
MCCg=test_shearlet_zernike_benigne(g,:);
MCC1=MCC';
MCC1g=MCCg';
d=MahalanobisDistance(MCC1,MCC1g);
Tsim(1,g)=d;
end
if (distance(i,1)==4)

%4/ Canberra Distance
 
 %% MCC %%%
MCC=test_shearlet_zernike_benigne(i,:);
MCCg=test_shearlet_zernike_benigne(g,:);
MCC1=MCC';
MCC1g=MCCg';
dcan=sum(abs(MCC-MCCg)/(abs(MCC)+abs(MCCg)));
Tsim(1,g)=dcan;
end
if (distance==5)
% 5/ Brag  Curtis 
% MCC %%%
MCC=test_shearlet_zernike_benigne(i,:);
MCCg=test_shearlet_zernike_benigne(g,:);
MCC1=MCC';
MCC1g=MCCg';
dbc= sum((MCC1-MCC1g)./(MCC1+MCC1g));
Tsim(i,g)=dbc;
end
if (distance(i,1)==6)
%6/ Chi-Squared

%% MCC %%%
MCC=test_shearlet_zernike_benigne(i,:);
MCCg=test_shearlet_zernike_benigne(g,:);
% MCC1=MCC';
% MCC1g=MCCg';
dCS = sum( (MCC-MCCg).^2 / (MCC+MCCg) ) / 2;
Tsim(1,g)=dCS;
end
% if(distance(i,1)==8)
% %8/Earth Mover's Distance
% 
% %% MCC %%%
% MCC= signature_f_DDSM(i,:);
% MCCg= signature_f_DDSM(g,:);
% %MCC1=MCC';
% %MCC1g=MCCg';
% D = distEmd(MCC,MCCg);
% Tsim(1,g)=D;
% end  
% normalized mutual information

end
%%%%%%%%%%%%%% Ranking of distances %%%%%%%%%%%%%%
[TIN,IN]=sort(Tsim, 'descend');


%%%%%%%%%%%%%% Ranking of distances %%%%%%%%%%%%%%
[TIN,IN]=sort(Tsim, 'descend');
   
k=1;
rank=IN(k,:);
[P,R]=precisionRecall(rank,y_test);
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
PP_shear_zernike_begnine=PP/74;
RR_shear_zernike_begnine=RR/74;
        MAP1_shear_zernike_begnine=MAP1/74;
        MAP5_shear_zernike_begnine=MAP5/74;
        MAP10_shear_zernike_begnine=MAP10/74;
        MAP20_shear_zernike_begnine=MAP20/74;
        MAPall_shear_zernike_begnine=MAPall/74;
