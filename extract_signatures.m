close all;
clear all;

signatures_MIAS_ALL_MC=zeros(322,74);
%signatures_DDSM=zeros(11218,74);
cp=1;
 for i=1:322
   
    sig=zeros(1,74);
    tc=0;
    tcf=0;
    cd('F:/code_test/MIAS/MC');
    %cd('C:/Users/admin/Desktop/memoire/code_test/DDSM');
    s=strcat(num2str(i), '.pgm'); % c'est le nom de l'image à lire dans notre cas: 1.bmp, etc.
	
    I1=imread(s);
    I=imresize(I1,[128 128]);
    figure,imshow(I);
  
cd('F:/code_test');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Local Binary Pattern Histogram Fourier Features %%%%%%%%%%
%EXAMPLE:    
tc=tcf+1;
mapping=getmaplbphf(8);
h=lbp(I,1,8,mapping,'h');
h=h/sum(h);
histograms(1,:)=h;
lbp_hf_features=constructhf(histograms,mapping);
tcf=tcf+size(lbp_hf_features,2);
sig(1,tc:tcf)=lbp_hf_features;

tc=tcf+1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mom Level shearlet
 X = double(I)/255;
 [ST,Psi] = shearletTransformSpect(X,1); 
  		

% %shearlet coefficient
 SC{i,:}=ST;
% %4 first Moments of sfearlet coefficients
 [Mom_lev1_sh]=compute_Mom_Shearlet_coff(ST);
 Mom_lev_sh=reshape(Mom_lev1_sh,[],1);
 tcf=tcf+size(Mom_lev_sh,1);
% %for j=size(lbpFeatures,2)+1:size(lbpFeatures,2)+size(Mom_lev_sh,2)
 sig(1,tc:tcf)=Mom_lev_sh';
 %tcf=tcf+size(Mom_lev_sh,1);
% %end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mom_level_curvelet coefficients
 %fdct_usfft_path;
    X=I; 
   % a(:,:,1);
    X=imresize(X,[512 512]);
    C =  fdct_usfft(X,1,4);
    curv_usfft{1}=C;
     [Mom_lev1]=compute_coff(C);
     Mom_lev=reshape(Mom_lev1,[],1);
     tc=tcf+1;
     tcf=tcf+size(Mom_lev,1);
     sig(1,tc:tcf)=Mom_lev';
   % signatures((size(lbpFeatures,1)+size(Mom_lev_sh,1)+1):size( Mom_lev,1),(size(lbpFeatures,2)+size(Mom_lev_sh,2)+1):size( Mom_lev,2))=Mom_lev;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


signatures_MIAS_ALL_MC(cp,:)=sig;
%signatures_DDSM(cp,:)=sig;
cp=cp+1;
  end