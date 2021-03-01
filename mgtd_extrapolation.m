%% extrapolation
clear all; close all;
load mgtd_mat.mat;


for i = 1:2
    vy = 4:8;
    v_temp = mgtd_mat(4:8,i);
    vyq_temp = [i+1:3 4 5 6 7 8]';
    vq = interp1(vy, v_temp, vyq_temp, 'linear','extrap');
    mgtd_mat(i+1:8, i) = vq;
end

vx = [1,3:7];
v_temp = [mgtd_mat(8,1), mgtd_mat(8, 3:7)];
vxq_temp = 1:7;
vq = interp1(vx, v_temp, vxq_temp, 'linear','extrap');
mgtd_mat(8,1:7) = vq;

for vy = 2:8
    for vx = 1:vy-1
        mgtd_mat(vx,vy) =  mgtd_mat(vy,vx);
    end
end

for i = 1:8
    vx = 1:8;
    vx(i) = [];
    v_temp = mgtd_mat(i,1:8);
    v_temp(i) = [];
    vxq_temp = 1:8;
    vq = interp1(vx, v_temp, vxq_temp, 'spline','extrap');
    mgtd_mat(i,1:8) = vq;
end





mgtd_mat

%%

fig2 = figure(2);
set(fig2, 'OuterPosition', [1000 30 900 900]);  
[C,h] = contour(mgtd_mat,15 ,'ShowText','on'); h.LineWidth = 2;
clabel(C,h,'FontSize',12,'FontWeight','bold','FontName','Times New Roman', 'LabelSpacing', 200);
title('Direction Angle of Magnetic Field (DEG)','FontSize',20,'FontWeight','bold','FontName','Times New Roman');
xlabel('V_{x} [V]','FontSize',20,'FontWeight','bold','FontName','Times New Roman'); 
ylabel('V_{y} [V]','FontSize',20,'FontWeight','bold','FontName','Times New Roman');
zticks(0:15:90);
colorbar('Ticks',0:15:90,'TickLabels',{'0','15','30','45','60','75','90'});
grid on;