% 对图像分别进行 灰度拉伸和直方图均衡化处理
I=imread('GREY_Yukari.jpg');
J=imadjust(I,[0.2 0.6], [0 1]);
K=histeq(I);
subplot(2,3,1),imhist(I),title("原图");
subplot(2,3,2),imhist(J),title("灰度拉伸");
subplot(2,3,3),imhist(K),title("直方图均衡化");
subplot(2,3,4),imshow(I),title("原图");
subplot(2,3,5),imshow(J),title("灰度拉伸");
subplot(2,3,6),imshow(K),title("直方图均衡化");