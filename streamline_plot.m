clear all; close all; clc;
load("x_2d.mat"); load("y_2d.mat"); load("z_2d.mat");
load ("u_2d_off1120.mat"); load ("v_2d_off1120.mat"); load ("w_2d_off1120.mat");
load ("u_2d_x4y10.mat"); load ("v_2d_x4y10.mat"); load ("w_2d_x4y10.mat");
u_2dx4y10 = u_2d; v_2dx4y10 = v_2d; w_2dx4y10 = w_2d;
load ("u_2d_x6y10.mat"); load ("v_2d_x6y10.mat"); load ("w_2d_x6y10.mat");
u_2dx6y10 = u_2d; v_2dx6y10 = v_2d; w_2dx6y10 = w_2d;
load ("u_2d_x6y8.mat"); load ("v_2d_x6y8.mat"); load ("w_2d_x6y8.mat");
u_2dx6y8 = u_2d; v_2dx6y8 = v_2d; w_2dx6y8 = w_2d;
%%
uu_2dx4y10 = u_2dx4y10 - u_2d_off;
vv_2dx4y10 = v_2dx4y10 - v_2d_off;
ww_2dx4y10 = w_2dx4y10 - w_2d_off;
density = 4;

figure(1);                      
streamslice(x_2d, y_2d, uu_2dx4y10, vv_2dx4y10, density, 'r'); 
axis equal; axis([-20 20 -20 20])
title('V_{x} = 4V, V_{y} = 10V');

% Circle / Line
theta = 0:0.01:2*pi;
r = 20;
x_c = r * cos(theta);
y_c = r * sin(theta);
hold all; plot(x_c, y_c, 'r', 'linewidth', 0.3);

r = 7.5;
x_c = r * cos(theta);
y_c = r * sin(theta);
hold all; plot(x_c, y_c, 'r', 'linewidth', 0.3);

x_l = [0, 0, 100, -100, -100, 100, - 100, 100];
y_l = [100, -100, 0, 0, -100, 100, 100, -100];
hold all; plot(x_l, y_l, '-k', 'linewidth', 0.3);


%%
uu_2dx6y10 = u_2dx6y10 - u_2d_off;
vv_2dx6y10 = v_2dx6y10 - v_2d_off;
ww_2dx6y10 = w_2dx6y10 - w_2d_off;
density = 4;

figure(2);                      
streamslice(x_2d, y_2d, uu_2dx6y10, vv_2dx6y10, density, 'r'); 
axis equal; axis([-20 20 -20 20])
title('V_{x} = 6V, V_{y} = 10V');

% Circle / Line
theta = 0:0.01:2*pi;
r = 20;
x_c = r * cos(theta);
y_c = r * sin(theta);
hold all; plot(x_c, y_c, 'r', 'linewidth', 0.3);

r = 7.5;
x_c = r * cos(theta);
y_c = r * sin(theta);
hold all; plot(x_c, y_c, 'r', 'linewidth', 0.3);

x_l = [0, 0, 100, -100, -100, 100, - 100, 100];
y_l = [100, -100, 0, 0, -100, 100, 100, -100];
hold all; plot(x_l, y_l, '-k', 'linewidth', 0.3);

%%
uu_2dx6y8 = u_2dx6y8 - u_2d_off;
vv_2dx6y8 = v_2dx6y8 - v_2d_off;
ww_2dx6y8 = w_2dx6y8 - w_2d_off;
density = 4;

figure(3);                      
streamslice(x_2d, y_2d, uu_2dx6y8, vv_2dx6y8, density, 'r'); 
axis equal; axis([-20 20 -20 20])
title('V_{x} = 6V, V_{y} = 8V');

% Circle / Line
theta = 0:0.01:2*pi;
r = 20;
x_c = r * cos(theta);
y_c = r * sin(theta);
hold all; plot(x_c, y_c, 'r', 'linewidth', 0.3);

r = 7.5;
x_c = r * cos(theta);
y_c = r * sin(theta);
hold all; plot(x_c, y_c, 'r', 'linewidth', 0.3);

x_l = [0, 0, 100, -100, -100, 100, - 100, 100];
y_l = [100, -100, 0, 0, -100, 100, 100, -100];
hold all; plot(x_l, y_l, '-k', 'linewidth', 0.3);