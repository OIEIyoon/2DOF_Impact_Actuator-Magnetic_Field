clear all; close all;
load atan1mat.mat;
load mgtd_mat.mat;


for i = 1:2
    vy = [i 4 5 6 7 8];
    v_temp = [atan1mat(i,i); atan1mat(4:8,i)];
    vyq_temp = 1:8;
    vq = interp1(vy, v_temp, vyq_temp,'spline','extrap');
    atan1mat(i:8, i) = vq(i:8);
end

for vy = 2:8
    for vx = 1:vy-1
        atan1mat(vx,vy) = 90 - atan1mat(vy,vx);
    end
end

[vx vy] = meshgrid(1:8, 1:8);
[vx_new vy_new] = meshgrid(1:0.2:8, 1:0.2:8);
Vq = interp2(vx, vy, atan1mat, vx_new,vy_new, 'cubic');

fig2 = figure(2);
set(fig2, 'OuterPosition', [1000 30 900 900]);  
[C,h] = contour(vx_new, vy_new, Vq, 'ShowText','on'); h.LineWidth = 2;
clabel(C,h,'FontSize',15,'FontWeight','bold','FontName','Times New Roman', 'LabelSpacing', 200);
title('Direction Angle of Magnetic Field (DEG)','FontSize',20,'FontWeight','bold','FontName','Times New Roman');
xlabel('V_{x} [V]','FontSize',20,'FontWeight','bold','FontName','Times New Roman'); 
ylabel('V_{y} [V]','FontSize',20,'FontWeight','bold','FontName','Times New Roman');
zticks(0:15:90);
colorbar('Ticks',0:15:90,'TickLabels',{'0^{\circ}','15^{\circ}','30^{\circ}','45^{\circ}','60^{\circ}','75^{\circ}','90^{\circ}'}','FontSize', 18, 'FontWeight','bold','FontName','Times New Roman');
grid on;

% fig1 = figure(1);
% set(fig1, 'OuterPosition', [0 30 900 900]);   
% surf(vx_new, vy_new, Vq)
% axis([1 8 1 8 0 90])
% xlabel('V_{x} [V]','FontSize',20,'FontWeight','bold','FontName','Times New Roman'); 
% ylabel('V_{y} [V]','FontSize',20,'FontWeight','bold','FontName','Times New Roman');
% zlabel('Direction Angle of Magnetic Field (DEG)','FontSize',20,'FontWeight','bold','FontName','Times New Roman');
% zticks(0:15:90);
% colorbar('Ticks',0:15:90,'TickLabels',{'0','15','30','45','60','75','90'});
% hold on;
% x1 = linspace(1,8,8); y1 = linspace(1,8,8); z1 = linspace(45,45,8);
% plot3(x1, y1, z1, ':g');

%%
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

[vx vy] = meshgrid(1:8, 1:8);
[vx_new vy_new] = meshgrid(1:0.2:8, 1:0.2:8);
Vq = interp2(vx, vy, mgtd_mat, vx_new,vy_new, 'spline');

fig3 = figure(3);
set(fig3, 'OuterPosition', [30 30 900 900]);  
[C,h] = contour(vx_new, vy_new, Vq,10 ,'ShowText','on'); h.LineWidth = 2;
clabel(C,h,'FontSize', 15, 'FontWeight','bold','FontName','Times New Roman', 'LabelSpacing', 200);
title('Magnitude of Magnetic Field ({\mu}T)','FontSize', 20, 'FontWeight','bold','FontName','Times New Roman');
xlabel('V_{x} [V]','FontSize', 20, 'FontWeight','bold','FontName','Times New Roman'); 
ylabel('V_{y} [V]','FontSize', 20, 'FontWeight','bold','FontName','Times New Roman');
colorbar('Ticks',0:200:2000,'TickLabels',{'0 {\mu}T','200 {\mu}T','400 {\mu}T','600 {\mu}T','800 {\mu}T','1000 {\mu}T','1200 {\mu}T','1400 {\mu}T','1600 {\mu}T','1800 {\mu}T','2000 {\mu}T'}','FontSize', 18, 'FontWeight','bold','FontName','Times New Roman');
grid on;