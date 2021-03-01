clear all; clc; close all;
load("mag_calib.mat");
n = length(data1(:,1))
field = ["test1", "test2", "test3", "test4"];
for test = 1:4
    value(test) = {data1(1:n, (1+(test-1)*3):test*3)};
end
data = struct(field(1), value(1), field(2), value(2), field(3), value(3), field(4), value(4));


% mean value
xmean_type1 = [mean(data.test1(:, 1)), mean(data.test4(:, 1))];
xmean_type2 = [mean(data.test2(:, 1)), mean(data.test3(:, 1))];
figure(1)
histogram(data.test1(:, 1), 50); hold all; 
histogram(data.test2(:, 1), 50); hold all;
histogram(data.test3(:, 1), 50); hold all; 
histogram(data.test4(:, 1), 50); legend

ymean_type1 = [mean(data.test1(:, 2)), mean(data.test3(:, 2))];
ymean_type2 = [mean(data.test2(:, 2)), mean(data.test4(:, 2))];
figure(2)
histogram(data.test1(:, 2), 30); hold all; 
histogram(data.test2(:, 2), 30); hold all;
histogram(data.test3(:, 2), 30); hold all; 
histogram(data.test4(:, 2), 30); legend

zmean_type1 = [mean(data.test1(:, 3)), mean(data.test2(:, 3))];
zmean_type2 = [mean(data.test3(:, 3)), mean(data.test4(:, 3))];
figure(3)
histogram(data.test1(:, 3), 30); hold all; 
histogram(data.test2(:, 3), 30); hold all;
histogram(data.test3(:, 3), 30); hold all; 
histogram(data.test4(:, 3), 30); legend

% calib. del_value
del_x = mean(xmean_type2 + xmean_type1)/2
del_y = mean(ymean_type2 + ymean_type1)/2
del_z = mean(zmean_type2 + zmean_type1)/2

%% rotation
clear all; clc; close all;
load("mag_calib_rot.mat");
n = length(data1(:,1))
field = ["test1", "test2", "test3", "test4"];
for test = 1:4
    value(test) = {data1(1:n, (1+(test-1)*3):test*3)};
end
data = struct(field(1), value(1), field(2), value(2), field(3), value(3), field(4), value(4));

xmean_type1 = [mean(data.test1(:, 1)), mean(data.test3(:, 1))]
xcenter_type1 = mean(xmean_type1);
data.test1(:, 1) = data.test1(:, 1) - xcenter_type1
data.test3(:, 1) = data.test3(:, 1) - xcenter_type1
histogram(data.test1(:, 1),20); hold all; histogram(data.test3(:, 1),20)

xmean_type2 = [mean(data.test2(:, 1)), mean(data.test4(:, 1))]
xcenter_type2 = mean(xmean_type2);
data.test2(:, 1) = data.test2(:, 1) - xcenter_type2
data.test4(:, 1) = data.test4(:, 1) - xcenter_type2
figure(2); histogram(data.test2(:, 1),20); hold all; histogram(data.test4(:, 1),20)

ymean_type1 = [mean(data.test1(:, 2)), mean(data.test3(:, 2))]
ycenter_type1 = mean(ymean_type1);
data.test1(:, 2) = data.test1(:, 2) - ycenter_type1
data.test3(:, 2) = data.test3(:, 2) - ycenter_type1
figure(3); histogram(data.test1(:, 2),20); hold all; histogram(data.test3(:, 2),20)

ymean_type2 = [mean(data.test2(:, 2)), mean(data.test4(:, 2))]
ycenter_type2 = mean(ymean_type2);
data.test2(:, 2) = data.test2(:, 2) - ycenter_type2
data.test4(:, 2) = data.test4(:, 2) - ycenter_type2
figure(4); histogram(data.test2(:, 2),20); hold all; histogram(data.test4(:, 2),20)