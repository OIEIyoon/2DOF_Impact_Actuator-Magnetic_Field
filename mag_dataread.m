% sheet1: off1120 
% sheet2: off 
% sheet3: x 0V, y 10V 
% sheet4: x 6V, y 8V 
% sheet5: x 6V, y 10V
% sheet6: x 4V, y 10V
%%
clear all; clc; close all;

for sheet_num = 11:11
    if sheet_num == 1
        data2 = xlsread('mag_data.xlsx', sheet_num, 'A:C');
        save 'mag_data_off1120.mat', data2;
    elseif sheet_num == 2
        data2 = xlsread('mag_data.xlsx', sheet_num, 'A:C');
        save 'mag_data_off.mat', data2;
    elseif sheet_num == 3
        data1 = xlsread('mag_data.xlsx', sheet_num, 'A:C');
        save 'mag_data_x0y10.mat', data1;
    elseif sheet_num == 4
        data1 = xlsread('mag_data.xlsx', sheet_num, 'A:C');
        save 'mag_data_x6y8.mat', data1;
    elseif sheet_num == 5
        data1 = xlsread('mag_data.xlsx', sheet_num, 'A:C');
        save 'mag_data_x6y10.mat', data1;
    elseif sheet_num == 6
        data1 = xlsread('mag_data.xlsx', sheet_num, 'A:C');
        save 'mag_data_x4y10.mat', data1;
    elseif sheet_num == 7
        data1 = xlsread('mag_data.xlsx', sheet_num, 'A:C');
        save 'mag_data_x8y10.mat', data1;
    elseif sheet_num == 8
        data1 = xlsread('mag_data.xlsx', sheet_num, 'A:C');
        save 'mag_data_x10y10.mat', data1;
    elseif sheet_num == 10
        data3 = xlsread('mag_data.xlsx', sheet_num, 'A:C');
        save 'mag_data_center.mat', data3;
    elseif sheet_num == 11
        data4 = xlsread('mag_data.xlsx', sheet_num, 'A:C');
        save 'mag_data_tot.mat', data4;
    end
end