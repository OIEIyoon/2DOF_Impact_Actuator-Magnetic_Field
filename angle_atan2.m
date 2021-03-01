clear all; close all; clc;
Vx = 0;
Vy = 10;
open_path = 'C:\Users\HAPTIC\Desktop\김상윤\MATLAB\mag\';
chr1 = int2str(Vx); chr2 = int2str(Vy);
s = strcat("x",chr1,"y",chr2);
u_name = strcat("u_2d_",s,".mat");
v_name = strcat("v_2d_",s,".mat");
u_dat = dir([open_path, 'u_2d_*.mat']); 
v_dat = dir([open_path, 'v_2d_*.mat']);
for i = 1:length(u_dat)
    if u_dat(i).name == u_name && v_dat(i).name == v_name
        u_struct = load(u_dat(i).name);
        u = u_struct.u_2d;  
        v_struct = load(v_dat(i).name);
        v = v_struct.v_2d;        
    elseif u_dat(i).name == "u_2d_off.mat"  && v_dat(i).name == "v_2d_off.mat"
        u_struct = load(u_dat(i).name);
        u_off = u_struct.u_2d_off;  
        v_struct = load(v_dat(i).name);
        v_off = v_struct.v_2d_off;   
    end
end
u = u - u_off;
v = v - v_off;

n = length(u(:,1));
l_end = (n+1)/2 - 2;
u = u(l_end:l_end+4,l_end:l_end+4);
v = v(l_end:l_end+4,l_end:l_end+4);
x = zeros(5,5);
for i = 1:5
    x(:,i) = -8 + 4*(i-1);
end
y = x';

density = 2;
streamslice(x,y, u, v, density); 
axis equal; axis([-8 8 -8 8])

sumu = 0; sumv = 0;
count = 0;
for i = 1:5
    for j = 1:5
        if x(i,j)^2 + y(i,j)^2 <= 8^2
            i
            j
            sumu = sumu + u(i,j);
            sumv = sumv + v(i,j);
            count = count + 1;
        end
    end
end
meanu = sumu/count; meanv = sumv/count;
atan(meanv/meanu) * 180 / pi
