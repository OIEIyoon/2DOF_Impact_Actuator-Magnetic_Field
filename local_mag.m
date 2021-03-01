%%
clear all; clc; close all;
local_mag_data = xlsread('mag_data.xlsx', 9, 'A:C');
load x_2d.mat; load y_2d.mat; load z_2d.mat;
load u_2d_off.mat; load v_2d_off.mat; load w_2d_off.mat;
load uu_2d_c.mat; load vv_2d_c.mat; load ww_2d_c.mat;
x = x_2d(4:8, 4:8); y = y_2d(4:8, 4:8); z = z_2d(4:8, 4:8);
u_l_off = u_2d_off(4:8, 4:8); v_l_off = v_2d_off(4:8, 4:8); w_l_off = w_2d_off(4:8, 4:8);
uu_l_c = uu_2d_c(4:8, 4:8); vv_l_c = vv_2d_c(4:8, 4:8); ww_l_c = ww_2d_c(4:8, 4:8);
% save 'local_mag_data.mat', local_mag_data;

%% ZEROS
%--------- uvw_l_[vx][vy] = Zeros(5,5) ---------%
for vy = 4:8                
    for vx = 1:vy-1
        eval(['u_l_x',num2str(vx),'y',num2str(vy),'=zeros(5,5);']);
        eval(['v_l_x',num2str(vx),'y',num2str(vy),'=zeros(5,5);']);
        eval(['w_l_x',num2str(vx),'w',num2str(vy),'=zeros(5,5);']);
    end
end
%%
data_num = length(local_mag_data(:, 1));
gain = 1;
for ii = 1:data_num/12
    %--------- e.g. 407 => vx = 4V, vy = 7V ---------%
    v_temp = local_mag_data(12*(ii-1) + 1, 1);
    vx = floor(v_temp/100);
    vy = mod(v_temp, 100);
    for jj = 1:5
        x_temp = local_mag_data(12*(ii-1) + 2*jj + 1, 1);
        y_temp = local_mag_data(12*(ii-1) + 2*jj + 1, 2);
        u_temp = local_mag_data(12*(ii-1) + 2*jj + 2, 1) - u_l_off(y_temp/4 + 3, x_temp/4 + 3) + gain*uu_l_c(y_temp/4 + 3, x_temp/4 + 3);
        v_temp = local_mag_data(12*(ii-1) + 2*jj + 2, 2) - v_l_off(y_temp/4 + 3, x_temp/4 + 3) + gain*vv_l_c(y_temp/4 + 3, x_temp/4 + 3);
        w_temp = local_mag_data(12*(ii-1) + 2*jj + 2, 3) - w_l_off(y_temp/4 + 3, x_temp/4 + 3) + gain*ww_l_c(y_temp/4 + 3, x_temp/4 + 3);
        %--------- uvw_l_[vx][vy](y,x) = [u_temp] / [v_temp] / [w_temp] ---------%
        eval(['u_l_x',num2str(vx),'y',num2str(vy),'(',num2str(y_temp/4+3),',',num2str(x_temp/4+3),') = u_temp;']);
        eval(['v_l_x',num2str(vx),'y',num2str(vy),'(',num2str(y_temp/4+3),',',num2str(x_temp/4+3),') = v_temp;']);
        eval(['w_l_x',num2str(vx),'y',num2str(vy),'(',num2str(y_temp/4+3),',',num2str(x_temp/4+3),') = w_temp;']);
    end
end

%%
% subplot_count = 0;
% density = 2;
% fig1 = figure(1);
% set(fig1, 'Position', [10 10 1820 900]);
% for vy = 8:-1:4
%     for vx = 1:7
%         if vx < vy
%             subplot_count = subplot_count + 1;
%             subplot(5, 7, subplot_count)
%             eval(['streamslice(x, y, u_l_x',num2str(vx),'y',num2str(vy),', v_l_x',num2str(vx),'y',num2str(vy),', ',num2str(density),');']);
%             axis equal; axis([-8 8 -8 8]);
%             hold all;
%             
%             theta = 0:0.1:2*pi+0.1;
%             r = 7.5;
%             x_c = r * cos(theta);
%             y_c = r * sin(theta);
%             hold all; plot(x_c, y_c, '--r', 'linewidth', 0.1);
%         else
%             subplot_count = subplot_count + 1;
%             subplot(5, 7, subplot_count)
%             axis equal; axis([-8 8 -8 8]);
%         end
%     end
% end
%% quiver
atan2mat = zeros(5,7);
umat = zeros(5,7);
vmat = zeros(5,7);
for vy = 4:8
    for vx = 1:vy-1
        sumu = 0; sumv = 0;
        count = 0;

        eval(['u = u_l_x',num2str(vx),'y',num2str(vy),';']);
        eval(['v = v_l_x',num2str(vx),'y',num2str(vy),';']);
        for i = 1:5
            for j = 1:5
                if x(i,j)^2 + y(i,j)^2 <= 8^2                    
                    sumu = sumu + u(i,j);
                    sumv = sumv + v(i,j);
                    count = count + 1;
                end
            end
        end
        meanu = sumu/count; meanv = sumv/count;
        umat(vy, vx) = meanu;
        vmat(vy, vx) = meanv;
        atan1mat(vy, vx) = atan(meanv/meanu)*180/pi;
        mgtd_mat(vy, vx) = norm([meanu,meanv],2);
    end
end
atan1mat;
atan1mat = [atan1mat, zeros(8,1)] + diag(45*[1 1 1 1 1 1 1 1]);

save 'atan1mat' atan1mat;
save 'mgtd_mat' mgtd_mat;

% figure(2)
% quiver(umat, vmat);
% xlabel('Vx'); ylabel('Vy');
% axis equal; axis([0 8 3 9]);

% figure(3)
% streamslice(x, y, u_l_x2y6, v_l_x2y6, density);
% theta = 0:0.1:2*pi+0.1;
% r = 7.5;
% x_c = r * cos(theta);
% y_c = r * sin(theta);
% hold all; plot(x_c, y_c, '--r', 'linewidth', 0.1);
% axis equal; axis([-8 8 -8 8]);
%%
% for vx = 4:8
%     for vy = 1:1
%         file_name = ['u_l_x',num2str(vx),'y',num2str(vy)];
%         save(file_name);
%     end
% end