% i = imread("satomi.jpg");
%% 用input函数对用户输入进行处理
i = input("image:","s");
a = input("x:");
b = input("y:");
%% 对于文件存在的情况才进行后续操作
if exist(i,"file")
    % 此时必然可以的读入文件
    img = imread(i);
    info = imfinfo(i);
    x = info.Height;
    y = info.Width;
    %% 由于在边界，即横纵坐标等于1或者最大值的情况下，会存在周围的点不足8的情况，因此需要进行判断
    if a < x && b < y
        % 选取周围的8个点
        for i = -1:1   
            for j = -1:1
                % 判断这些点是否在图片上
                if a+i <= x && b+j <= x && a+i >= 1 && b+j >=1
                    fprintf("点(%d, %d)\n",a+i,b+j)
                    fprintf("R:%d, G:%d, B:%d\n",img(a+i,b+j,1),img(a+i,b+j,2),img(a+i,b+j,3))
                end
            end
        end
    else
        fprintf("wrong x,y input,image size = [%d, %d]",x,y);
    end
else
    fprintf("no such file\n")
end


