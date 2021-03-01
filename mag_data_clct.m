clear all; clc; close all;

%% data load
load("mag_data_x0y10.mat");
load("mag_data_off1120.mat");
load("mag_data_center.mat");
load("mag_data_tot.mat");
n = length(data1(:,1))/50;
m = length(data2(:,2))/50;
nm = length(data3(:,3))/2;
mn = length(data4(:,3))/2;

%% mag. field mean-value

%--------- POWER OFF ---------%
for i = 1:m                  
    pos_x_off(i) = data2(50*i - 49, 1);
    pos_y_off(i) = data2(50*i - 49, 2);
    pos_z_off(i) = 0;
    mag_x_off_mean(i) = mean(data2((50*i - 48):(50*i), 1));
    mag_y_off_mean(i) = mean(data2((50*i - 48):(50*i), 2));
    mag_z_off_mean(i) = mean(data2((50*i - 48):(50*i), 3));
end
%-----------------------------%


%--------- POWER  ON ---------%
for i = 1:n                  
    pos_x(i) = data1(50*i - 49, 1);
    pos_y(i) = data1(50*i - 49, 2);
    pos_z(i) = 0;
    mag_x_mean(i) = mean(data1((50*i - 48):(50*i), 1));
    mag_y_mean(i) = mean(data1((50*i - 48):(50*i), 2));
    mag_z_mean(i) = mean(data1((50*i - 48):(50*i), 3));
end
%-----------------------------%


%--------- CENTER 6V ---------%
for i = 1:nm                 
    pos_x_c(i) = data3(2*i - 1, 1);
    pos_y_c(i) = data3(2*i - 1, 2);
    pos_z_c(i) = 0;
    mag_x_mean_c(i) = data3(2*i, 1);
    mag_y_mean_c(i) = data3(2*i, 2);
    mag_z_mean_c(i) = data3(2*i, 3);
end
%-----------------------------%

%------------ TOT ------------%
for i = 1:nm                 
    pos_x_t(i) = data4(2*i - 1, 1);
    pos_y_t(i) = data4(2*i - 1, 2);
    pos_z_t(i) = 0;
    mag_x_mean_t(i) = data4(2*i, 1);
    mag_y_mean_t(i) = data4(2*i, 2);
    mag_z_mean_t(i) = data4(2*i, 3);
end
%-----------------------------%


%% data re-arr.
data_point = 11;
del_y = 40 / (data_point - 1);
y_num = data_point;
x_num = n/y_num;
x_num0 = m/y_num;
x_num_c = nm/y_num;
x_num_t = mn/y_num;
x_center = 6;
y_center = 6;

%--------- POWER OFF ---------%
count = 1;
for i = 1:x_num0             
    for j = 1:y_num
        x_2d_off(6 + pos_y_off(count)/del_y, 6 + pos_x_off(count)/del_y) = pos_x_off(count);       
        y_2d_off(6 + pos_y_off(count)/del_y, 6 + pos_x_off(count)/del_y) = pos_y_off(count);
        z_2d_off(6 + pos_y_off(count)/del_y, 6 + pos_x_off(count)/del_y) = pos_z_off(count);
        
        u_2d_off(6 + pos_y_off(count)/del_y, 6 + pos_x_off(count)/del_y) = mag_x_off_mean(count);        
        v_2d_off(6 + pos_y_off(count)/del_y, 6 + pos_x_off(count)/del_y) = mag_y_off_mean(count);        
        w_2d_off(6 + pos_y_off(count)/del_y, 6 + pos_x_off(count)/del_y) = mag_z_off_mean(count);
        count = count + 1;
    end
end
%-----------------------------%


%--------- POWER  ON ---------%
count = 1;
for i = 1:x_num              
    for j = 1:y_num
        x_2d(y_center + pos_y(count)/del_y, x_center + pos_x(count)/del_y) = pos_x(count);       
        y_2d(y_center + pos_y(count)/del_y, x_center + pos_x(count)/del_y) = pos_y(count);
        z_2d(y_center + pos_y(count)/del_y, x_center + pos_x(count)/del_y) = pos_z(count);
        
        u_2d(y_center + pos_y(count)/del_y, x_center + pos_x(count)/del_y) = mag_x_mean(count);        
        v_2d(y_center + pos_y(count)/del_y, x_center + pos_x(count)/del_y) = mag_y_mean(count);        
        w_2d(y_center + pos_y(count)/del_y, x_center + pos_x(count)/del_y) = mag_z_mean(count);
        count = count + 1;
    end
end
%-----------------------------%


%--------- CENTER 6V ---------%
count = 1;
for i = 1:x_num_c            
    for j = 1:y_num
        x_2d_c(y_center + pos_y_c(count)/del_y, x_center + pos_x_c(count)/del_y) = pos_x_c(count);       
        y_2d_c(y_center + pos_y_c(count)/del_y, x_center + pos_x_c(count)/del_y) = pos_y_c(count);
        z_2d_c(y_center + pos_y_c(count)/del_y, x_center + pos_x_c(count)/del_y) = pos_z_c(count);
        
        u_2d_c(y_center + pos_y_c(count)/del_y, x_center + pos_x_c(count)/del_y) = mag_x_mean_c(count);        
        v_2d_c(y_center + pos_y_c(count)/del_y, x_center + pos_x_c(count)/del_y) = mag_y_mean_c(count);        
        w_2d_c(y_center + pos_y_c(count)/del_y, x_center + pos_x_c(count)/del_y) = mag_z_mean_c(count);
        count = count + 1;
    end
end
%-----------------------------%

%------------ TOT ------------%
count = 1;
for i = 1:x_num_t            
    for j = 1:y_num
        x_2d_t(y_center + pos_y_t(count)/del_y, x_center + pos_x_t(count)/del_y) = pos_x_t(count);       
        y_2d_t(y_center + pos_y_t(count)/del_y, x_center + pos_x_t(count)/del_y) = pos_y_t(count);
        z_2d_t(y_center + pos_y_t(count)/del_y, x_center + pos_x_t(count)/del_y) = pos_z_t(count);
        
        u_2d_t(y_center + pos_y_t(count)/del_y, x_center + pos_x_t(count)/del_y) = mag_x_mean_t(count);        
        v_2d_t(y_center + pos_y_t(count)/del_y, x_center + pos_x_t(count)/del_y) = mag_y_mean_t(count);        
        w_2d_t(y_center + pos_y_t(count)/del_y, x_center + pos_x_t(count)/del_y) = mag_z_mean_t(count);
        count = count + 1;
    end
end
%-----------------------------%


%% streamline plot

close all
uu_2d = u_2d - u_2d_off;
vv_2d = v_2d - v_2d_off;
ww_2d = w_2d - w_2d_off;

uu_2d_c = u_2d_c - u_2d_off;
vv_2d_c = v_2d_c - v_2d_off;
ww_2d_c = w_2d_c - w_2d_off;

uu_2d_t = u_2d_t - u_2d_off;
vv_2d_t = v_2d_t - v_2d_off;
ww_2d_t = w_2d_t - w_2d_off;

%---- CENTRAL SOLENOID POSITION_INTERPOLATION  ----%
for i = 1:11
    x = -20:4:20;
    u_temp = uu_2d_c(i,:); 
    v_temp = vv_2d_c(i,:);
    xq_temp = -24:0.01:20;
    uq1 = interp1(x,u_temp,xq_temp,'spline');
    vq1 = interp1(x,v_temp,xq_temp,'spline');
    for j = 1:11
        uu_2d_c(i,j) = uq1(400*(j-1)+228);
        vv_2d_c(i,j) = vq1(400*(j-1)+228);
    end
end
for j = 1:11
    y = -20:4:20;
    u_temp = uu_2d_c(:,j); 
    v_temp = vv_2d_c(:,j);
    yq_temp = -24:0.01:20;
    uq1 = interp1(x,u_temp,yq_temp,'spline');
    vq1 = interp1(x,v_temp,yq_temp,'spline');
    for i = 1:11
        uu_2d_c(i,j) = uq1(400*(i-1)+366);
        vv_2d_c(i,j) = vq1(400*(i-1)+366);
    end
end
%--------------------------------------------------%

gain = 1;
uu = uu_2d + gain*uu_2d_c;
vv = vv_2d + gain*vv_2d_c;
ww = ww_2d + gain*ww_2d_c;
density = 3;

%--------- [u_2d, v_2d, w_2d] ---------%
fig1 = figure(1);
set(fig1, 'OuterPosition', [0 30 900 1050]); set(gcf,'Color','w')
figure(1);                      
streamslice(x_2d, y_2d, u_2d, v_2d, density); 
axis equal; axis([-20 20 -20 20]); grid on;
title({'V_{x} = 0V / V_{y} = 10V / V_{center} = 0V'},'FontSize',20,'FontWeight','bold','FontName','Times New Roman');
xlabel('X [mm]','FontSize',20,'FontWeight','bold','FontName','Times New Roman'); 
ylabel('Y [mm]','FontSize',20,'FontWeight','bold','FontName','Times New Roman'); 
ax1 = gca; grid on; ax1.GridAlpha = 0.35; 
ax1.FontName = 'Times New Roman'; ax1.FontSize = 16; ax1.FontWeight = 'bold';
%--------------------------------------%


%--------- [u_2d_off, v_2d_off, w_2d_off] ---------%
fig2 = figure(2);
set(fig2, 'OuterPosition', [0 30 900 1050]); set(gcf,'Color','w')                   
streamslice(x_2d, y_2d, u_2d_off, v_2d_off, density)
axis equal; axis([-20 20 -20 20]);  grid on;
title({'V_{x} = 0V / V_{y} = 0V / V_{center} = 0V'},'FontSize',20,'FontWeight','bold','FontName','Times New Roman');
xlabel('X [mm]','FontSize',20,'FontWeight','bold','FontName','Times New Roman'); 
ylabel('Y [mm]','FontSize',20,'FontWeight','bold','FontName','Times New Roman'); 
ax2 = gca; grid on; ax2.GridAlpha = 0.35; 
ax2.FontName = 'Times New Roman'; ax2.FontSize = 16; ax2.FontWeight = 'bold';
%--------------------------------------------------%


%--------- [u_2d - u_2d_off, v_2d - v_2d_off, w_2d - w_2d_off] ---------%
fig3 = figure(3);
set(fig3, 'OuterPosition', [0 30 900 1050]); set(gcf,'Color','w')                               
streamslice(x_2d, y_2d, uu_2d, vv_2d, density); 
axis equal; axis([-20 20 -20 20]);  grid on;
title({'V_{x} = 0V / V_{y} = 10V / V_{center} = 0V'},'FontSize',20,'FontWeight','bold','FontName','Times New Roman');
xlabel('X [mm]','FontSize',20,'FontWeight','bold','FontName','Times New Roman'); 
ylabel('Y [mm]','FontSize',20,'FontWeight','bold','FontName','Times New Roman'); 
ax3 = gca; grid on; ax3.GridAlpha = 0.35; 
ax3.FontName = 'Times New Roman'; ax3.FontSize = 16; ax3.FontWeight = 'bold';
%-----------------------------------------------------------------------%


%--------- [u_2d_c, v_2d_c, w_2d_c] ---------%
% figure(4);                      
% streamslice(x_2d_c, y_2d_c, u_2d_c, v_2d_c, density); 
% axis equal; axis([-20 20 -20 20])
%--------------------------------------------%


%--------- [u_2d_c - u_2d_off, v_2d_c - v_2d_off, w_2d_c - w_2d_off] ---------%
fig5 = figure(5);
set(fig5, 'OuterPosition', [10 10 900 1050]); set(gcf,'Color','w')                                  
streamslice(x_2d_c, y_2d_c, uu_2d_c, vv_2d_c, density); 
axis equal; axis([-20 20 -20 20]);  grid on;
title('V_{x} = 0V / V_{y} = 0V / V_{center} = 6V','FontSize',20,'FontWeight','bold','FontName','Times New Roman');
xlabel('X [mm]','FontSize',20,'FontWeight','bold','FontName','Times New Roman'); 
ylabel('Y [mm]','FontSize',20,'FontWeight','bold','FontName','Times New Roman'); 
ax4 = gca; grid on; ax4.GridAlpha = 0.35; 
ax4.FontName = 'Times New Roman'; ax4.FontSize = 16; ax4.FontWeight = 'bold';
%-----------------------------------------------------------------------------%


%--------- [u_2d_c - u_2d_off, v_2d_c - v_2d_off, w_2d_c - w_2d_off] ---------%
%---------   + [u_2d - u_2d_off, v_2d - v_2d_off, w_2d - w_2d_off]   ---------%
fig6 = figure(6);
set(fig6, 'OuterPosition', [0 30 900 1050]); set(gcf,'Color','w')                   
streamslice(x_2d_c, y_2d_c, uu, vv, density); 
axis equal; axis([-20 20 -20 20]);  grid on;
title({'V_{x} = 0V / V_{y} = 10V / V_{center} = 6V'},'FontSize',20,'FontWeight','bold','FontName','Times New Roman');
xlabel('X [mm]','FontSize',20,'FontWeight','bold','FontName','Times New Roman'); 
ylabel('Y [mm]','FontSize',20,'FontWeight','bold','FontName','Times New Roman'); 
ax4 = gca; grid on; ax4.GridAlpha = 0.35; 
ax4.FontName = 'Times New Roman'; ax4.FontSize = 16; ax4.FontWeight = 'bold';
%-----------------------------------------------------------------------------%

%--------- [u_2d_t - u_2d_off, v_2d_t - v_2d_off, w_2d_t - w_2d_off] ---------%
% fig7 = figure(7);
% set(fig7, 'OuterPosition', [900 30 900 1050]);                                  
% streamslice(x_2d_t, y_2d_t, uu_2d_t, vv_2d_t, density); 
% axis equal; axis([-20 20 -20 20])
% title('Total Magnetic Field (V_{x} = 0V, V_{y} = 6V, V_{center} = 6V)');
% xlabel('X [mm]','FontSize',12,'FontWeight','bold','FontName','Times New Roman'); 
% ylabel('Y [mm]','FontSize',12,'FontWeight','bold','FontName','Times New Roman'); 
%-----------------------------------------------------------------------------%


% contourf(x_2d, y_2d, w_2d)
% for i=0:1:6 
%     xpoints_origin_of_stream = i.*ones(1,41);                        % set the starting x-points of streamlines
%     ypoints_origin_of_stream = [-20:1:20];                          % set the starting y-points of streamlines
%     streamline(x_2d, y_2d, u_2d, v_2d ,xpoints_origin_of_stream,ypoints_origin_of_stream);hold on;
% end

%% Circle / Line
for i=[ 6]
    eval(['figure(',num2str(i),');']);
    hold all;
    theta = 0:0.1:2*pi+0.1;
    r = 20;
    x_c = r * cos(theta);
    y_c = r * sin(theta);    
    p1 = plot(x_c, y_c, 'r', 'linewidth', 0.5);
    r = 7.5;
    x_c = r * cos(theta);
    y_c = r * sin(theta);
    p2 = plot(x_c, y_c, '--k', 'linewidth', 2);
%     r = 15;
%     x_c = r * cos(theta);
%     y_c = r * sin(theta);
%     p3 = plot(x_c, y_c, '--k', 'linewidth', 0.5);
%     grid on;
    legend([p1 p2],{'Outer Line of Actuator','Boundary of Traveling Area of Magnet''s Center of Mass'},'FontSize',15,'FontWeight','bold','FontName','Times New Roman'); 
end
% 
% 
% x_l = [0, 0, 100, -100, -100, 100, - 100, 100];
% y_l = [100, -100, 0, 0, -100, 100, 100, -100];
% hold all; plot(x_l, y_l, '-k', 'linewidth', 0.3);

%% data extract
% save 'x_2d.mat' x_2d;
% save 'y_2d.mat' y_2d;
% save 'z_2d.mat' z_2d;
% 
% save 'u_2d_off1120.mat' u_2d_off;
% save 'v_2d_off1120.mat' v_2d_off;
% save 'w_2d_off1120.mat' w_2d_off;
%  
% save 'u_2d_x10y10.mat' u_2d;
% save 'v_2d_x10y10.mat' v_2d;
% save 'w_2d_x10y10.mat' w_2d;

% save 'uu_2d_c.mat' uu_2d_c;
% save 'vv_2d_c.mat' vv_2d_c;
% save 'ww_2d_c.mat' ww_2d_c;