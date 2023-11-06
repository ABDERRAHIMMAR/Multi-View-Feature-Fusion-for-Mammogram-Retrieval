
info = dicominfo('C:\Users\marwa\Desktop\mm\CBIS-DDSM\Calc-Test_P_00353_LEFT_MLO_2\08-29-2017-DDSM-49673\1.000000-ROI mask images-69211\1-1.dcm');
image1 = dicomread(info);
image1=imresize(image1,[128 128])

info1 = dicominfo('C:\Users\marwa\Desktop\mm\CBIS-DDSM\Calc-Test_P_02432_LEFT_MLO_1\08-29-2017-DDSM-63022\1.000000-ROI mask images-80183\1-1.dcm');
image2 = dicomread(info1);
image2=imresize(image2,[128 128])

info2 = dicominfo('C:\Users\marwa\Desktop\mm\CBIS-DDSM\Calc-Test_P_00127_RIGHT_MLO_1\08-29-2017-DDSM-21931\1.000000-ROI mask images-33642\1-1.dcm');
image3 = dicomread(info2);
image3=imresize(image3,[128 128])

info3 = dicominfo('C:\Users\marwa\Desktop\mm\CBIS-DDSM\Calc-Test_P_00202_RIGHT_MLO_2\08-29-2017-DDSM-02375\1.000000-ROI mask images-52592\1-1.dcm');
image4 = dicomread(info3);
image4=imresize(image4,[128 128])

info5 = dicominfo('C:\Users\marwa\Desktop\mm\CBIS-DDSM\Calc-Test_P_00299_RIGHT_MLO_1\08-29-2017-DDSM-63777\1.000000-ROI mask images-10820\1-1.dcm');
image5 = dicomread(info5);
image5=imresize(image5,[128 128])

info6 = dicominfo('C:\Users\marwa\Desktop\mm\CBIS-DDSM\Calc-Test_P_00372_RIGHT_MLO_1\08-29-2017-DDSM-04213\1.000000-ROI mask images-99590\1-1.dcm');
image6 = dicomread(info6);
image6=imresize(image6,[128 128])
figure

subplot(1,6,1), imshow(image1), 
subplot(1,6,2), imshow(image2),
subplot(1,6,3), imshow(image3), 
subplot(1,6,4), imshow(image4),
subplot(1,6,5), imshow(image5),
subplot(1,6,6), imshow(image6),