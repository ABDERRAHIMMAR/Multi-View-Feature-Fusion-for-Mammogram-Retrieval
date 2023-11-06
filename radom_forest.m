clear all;
close all; 
clc;


load LBPHF_shear2_four_zernike2
load test_LBPHF_shear2_four_zernike2

load Y_LBPHF_shear2_four_zernike2
load Y_test_LBPHF_shear2_four_zernike2

Xtrn=LBPHF_shear2_four_zernike2;
   
Y_trn=Y_LBPHF_shear2_four_zernike2;
    
X_tst=test_LBPHF_shear2_four_zernike2;

Y_tst=Y_test_LBPHF_shear2_four_zernike2;

tic;

ModelRF = classRF_train(Xtrn,Y_trn,500);
    
Y_hatLBPHF_shear2_four_zernike2= classRF_predict(X_tst,ModelRF); 

best_accuracy=length(find(Y_hatLBPHF_shear2_four_zernike2==Y_tst))/length(Y_tst)*100;
fprintf('RF Classification Accuracy is %.4f \n',best_accuracy);

EVAL = Evaluate(Y_tst,Y_hatLBPHF_shear2_four_zernike2)

save Y_hatLBPHF_shear2_four_zernike2 Y_hatLBPHF_shear2_four_zernike2
