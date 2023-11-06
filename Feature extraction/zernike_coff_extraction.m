clc; clear all; close all;
for i=1:246
   
%sig=zeros(1,74);

    cd('D:\DATA\test');
    %cd('C:/Users/admin/Desktop/memoire/code_test/DDSM');
    s=strcat(num2str(i), '.dcm'); % c'est le nom de l'image à lire dans notre cas: 1.bmp, etc.
    I1=dicomread(s);
I1=imresize(i,[256 256]);
I1 = double(I1);
n = 4; m = 2;           % appropriate descriptor of the oval shape
[Z1, AOH, PhiOH] = Zernikmoment(I1,n,m);
sZ(i,:)=Z1;
n = 6; m = 0;           % a fair ability in measuring irregularity in shape

[Z2, AOH, PhiOH] = Zernikmoment(I1,n,m);
sZ1(i,:)=Z2;
n = 9; m = 7;           % by increasing the indistinctness of a mass boundary, Z9,7

[Z3, AOH, PhiOH] = Zernikmoment(I1,n,m);

sZ2(i,:)=Z3;
end