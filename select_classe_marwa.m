clear all;
clear all;
clear all;
close all; 
clc;
% LBPHF_zernike,LBPHF_zernike

load y_train;
load y_test;
load test_LBPHF_shear2_four_zernike2


 for i=1:123
k=i
 Tsim=zeros(7,123);
for g=1:123
% 
%      P=zeros(9216,8);
%      R=zeros(9216,8);
%      map1=zeros(1,8);
%      map20=zeros(1,8);
%      mapall=zeros(1,8);
 %1/ Euclidean distance

%% MCC %%%
MCC=test_LBPHF_shear2_four_zernike2(i,:);
MCCy=test_LBPHF_shear2_four_zernike2(g,:);
MCC1=MCC';
MCC1y=MCCy';
de= sqrt(sum((MCC1-MCC1y).^2));
Tsim(1,g)=de;
%2/ Manhattan distance

%% MCC %%%
MCC=test_LBPHF_shear2_four_zernike2(i,:);
MCCy=test_LBPHF_shear2_four_zernike2(g,:);
MCC1=MCC';
MCC1y=MCCy';
dhat=sum(abs(MCC1-MCC1y));
Tsim(2,g)=dhat;
% 3/ d=MahalanobisDistance(A, B)

%% MCC %%%
MCC=test_LBPHF_shear2_four_zernike2(i,:);
MCCy=test_LBPHF_shear2_four_zernike2(g,:);
MCC1=MCC';
MCC1y=MCCy';
d=MahalanobisDistance(MCC1,MCC1y);
Tsim(3,g)=d;
%4/ Canberra Distance
 
 %% MCC %%%
 MCC=test_LBPHF_shear2_four_zernike2(i,:);
MCCy=test_LBPHF_shear2_four_zernike2(g,:);
MCC1=MCC';
MCC1y=MCCy';
dcan=sum(abs(MCC-MCCy)/(abs(MCC)+abs(MCCy)));
Tsim(4,g)=dcan;
%5/ Bray  Curtis 
%% MCC %%%
MCC=test_LBPHF_shear2_four_zernike2(i,:);
MCCy=test_LBPHF_shear2_four_zernike2(g,:);
MCC1=MCC';
MCC1y=MCCy';
dbc= sum((MCC1-MCC1y)./(MCC1+MCC1y));
Tsim(5,g)=dbc;
%6/ Chi-Squared
%% MCC %%%
 MCC=test_LBPHF_shear2_four_zernike2(i,:);
MCCy=test_LBPHF_shear2_four_zernike2(g,:);
% MCC1=MCC';
% MCC1y=MCCy';
dCS = sum( (MCC-MCCy).^2 / (MCC+MCCy) ) / 2;
Tsim(6,g)=dCS;
%7/Pearson Correlation Coefficient
 %% MCC %%
MCC=test_LBPHF_shear2_four_zernike2(i,:);
MCCy=test_LBPHF_shear2_four_zernike2(g,:);
MCC1=MCC';
MCC1y=MCCy';
CR = corrcoef(MCC1,MCC1y,'Pearson');
Tsim(7,g)= CR;
%8/Earth Mover's Distance
%% MCC %%%
% MCC=test_LBPHF_shear2_four_zernike2(i,:);
% MCCy=curv_shear_four_zernike-12(g,:);
% % MCC1=MCC';
% % MCC1y=MCCy';
% D = distEmd(MCC,MCCy);
% Tsim(8,g)=D;
  end

%%%%%%%%%%%%%% Ranking of distances %%%%%%%%%%%%%%
[TIN,IN]=sort(Tsim, 1, 'descend'); % tableau trier pour chaque image la class de distnce
%ww=class_DDSM(1,161);
%    for k=1:8 
%         rank=IN(k,:);
%         [P,R]=precisionRecall(rank,class_N_A);
%         %map1(1,k)=mean(P(1,k));
%         map5(i,k)=mean(P(1:5,k));
%         map10(i,k)=mean(P(1:10,k));
%         %map20(1,k)=mean(P(1:20,k));
%         %mapall(1,k)=mean(P(:,k));
%    end
%    PP=PP+P;
%    RR=RR+R; 

 end  
for i=1:123

Y_test_LBPHF_shear2_four_zernike2(i,1)=IN(1,i);
    
end    
 
% PP=PP/size(signature_f_DDSM,1);
% RR=RR/size(signature_f_DDSM,1);
% [TIN,IN]=sort(map10, 2, 'descend');
% for h=1:11219
%     if (IN(h,1)==7)
%         if (IN(h,2)==5)
%        Y_tD(h,1)=IN(h,3);
%        else
%         Y_tD(h,1)=IN(h,2);
%         end
%     else Y_tD(h,1)=IN(h,1);  
%     end
%     
%     if (IN(h,1)==5)
%         if (IN(h,2)==7)
%        Y_tD(h,1)=IN(h,3);
%        else
%         Y_tD(h,1)=IN(h,2);
%         end
%      else Y_Mias(h,1)=IN(h,1);  
%    end
% end
save Y_test_LBPHF_shear2_four_zernike2 Y_test_LBPHF_shear2_four_zernike2;