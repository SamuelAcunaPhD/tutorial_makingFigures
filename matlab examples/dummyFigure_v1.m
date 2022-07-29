% Filename: dummyFigure_v1.m
% Author:   Samuel Acuña
% Date:     23 Jan 2019
% Description: An example figure, with dummy data. no special formatting
%
% NOTE: This example was created using MatLab R2018a
clear; close all; clc;

%% dummy data

data_x = -pi:0.01:pi;
data_y1 = 5*sin(data_x); 
data_y2 = sin(10*data_x)-1.5*data_x;

data_bars = [5*rand(4,1) + 10, 10*rand(4,1) + 12, 4*rand(4,1) + 5];

data_time = [1:5];
data_means1 = 3*rand(5,1)+5;
data_error1 = 2*rand(5,1);
data_means2 = 2*rand(5,1)+4;
data_error2 = 3*rand(5,1);

%% plot dummy data 
% create a figure
figure(); 

% axes 1
subplot(2,2,[1 2]); 
plot(data_x,data_y1);
hold on
plot(data_x,data_y2);
hold off
title('example plot 1');
xlabel('x values');
ylabel('y values');
xticks([-pi -0.5*pi 0 0.5*pi pi])
xticklabels({'-\pi','-0.5\pi','0','0.5\pi','\pi'})
legend('Blue line','Red line');

% axes 2
subplot(2,2,3);
bar(1:4,data_bars);
title('example plot 2');
xlabel('groups');
xticklabels({'A','B','C','D'})
ylabel('y_values');

% axes 3
subplot(2,2,4); 
errorbar(data_time,data_means1,[],data_error1,'bo-');
hold on
errorbar(data_time,data_means2,data_error2,[],'ro:');
hold off
title('example plot 3');
xlabel('time (sec)');
ylabel('y_values');

% At this point the figure doesnt look publication worthy.
return