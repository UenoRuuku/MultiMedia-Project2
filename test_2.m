%% 用input函数对用户输入进行处理
im = input("image:","s");
%% 对于文件存在的情况才进行后续操作
if exist(im,"file")
    img = imread(im);
    info = imfinfo(im);
    x = info.Height;
    y = info.Width;
    % 新建空数组
    output = zeros(x,y);
%% 将图片进行灰度转化
% 由于此时求出的值仍旧是在0-255区间的，因此应该进行变化
    for i = 1:x
        for j = 1:y
            output(i,j) =  0.29900 * img(i,j,1) + 0.58700 * img(i,j,2) + 0.11400 * img(i,j,3);
        end
    end
    % 文件名
    str = "GREY_";
%% 求方差
    % 求出平均灰度
    average = (sum(sum(output/265))/(x*y));
    % 求出方差的分子
    total = 0;
    for i = 1:x
        for j = 1:y
            total = total + (output(i,j)/256-average).^2;
        end
    end
    fprintf("方差为 %s \n", num2str(total/(x*y)));
    imwrite(output/256,strcat(str,im));
else
    fprintf("no such file.\n")
end