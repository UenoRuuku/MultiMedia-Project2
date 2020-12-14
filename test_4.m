%% 读取文件
file = 'Yukari.jpg';
I=imread(file);
J2=imnoise(I,'salt & pepper',0.04);
%% 高斯滤波
h = fspecial("gaussian",3);
B = imfilter(J2,h,"corr","replicate");
%% 平均模板滤波
h = fspecial("average",3);
C = imfilter(J2,h,"corr","replicate");
%% 中值滤波
% 中值滤波只能对二维数组进行操作，因此选择将RGB通道全部分开
D = medfilt2(J2(:,:,1),[3,3]);
E = medfilt2(J2(:,:,2),[3,3]);
F = medfilt2(J2(:,:,3),[3,3]);
% 合并三个通道
% 将G设置成和原图大小相同的图片，方便起见直接使用了J2，即增加噪声后的图片
G = J2;
G(:,:,1) = D(:,:,1);
G(:,:,2) = E(:,:,1);
G(:,:,3) = F(:,:,1);
%% 输出
subplot(2,3,1);imshow(I);title("原图");
subplot(2,3,2);imshow(J2);title("加噪声");
subplot(2,3,3);imshow(B);title("高斯滤波");
subplot(2,3,4);imshow(C);title("平均模板滤波");
subplot(2,3,5);imshow(G);title("中值滤波");