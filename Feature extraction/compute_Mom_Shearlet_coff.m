function [Mom_lev]=compute_Mom_Shearlet_coff(sc)
%input:  SC: Shearlet coeifficient 

%output:
%        Mom_lev: moment of shearlet coeifficient at each sub_band: mean, variance,kurtosis and
%        skweness

Mom_lev = [];
cfs =[];mlev=[];lev=[];klev=[];slev=[];vlev=[];
for s=1:size(sc,3)
    cfs1=[];
  cfs1=reshape(sc(:,:,s),[],1);
    cfs1 = [cfs1; abs(cfs1)];
   

  cfs1 = sort(cfs1, 'descend'); 
      [N2,M2]=size(cfs1);    N2=max(N2,M2);
 
%----  compute moment cof at each level
   mlev=[mlev;mean(cfs1)]; 
   vlev=[vlev;var(cfs1)];   
   klev=[klev;(N2*kurtosis(cfs1)/sqrt(24*N2))-sqrt(3*N2/8)];   
   slev=[slev;N2*skewness(cfs1)/sqrt(6*N2)];
end
Mom_lev = [mlev;vlev;klev;slev];
