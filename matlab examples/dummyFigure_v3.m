% Filename: dummyFigure_v3.m
% Author:   Samuel Acuña
% Date:     23 Jan 2019
% Description: An example figure, with dummy data. adding formatting, and code to save figure as vector image.
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
% note: I use Handles for most elements of my plots, in case I need to go
% back and adjust their properties. Not all will be used in this example.
% If you need to pull a handle for pervious plots, try : 
%   h = get(ax(3), 'children'); % pull handles of lines

% create a figure
fig = figure();
fig.Name = 'example figure';
fig.Color = [1 1 1]; % or = 'w'; % set background color to white

% axes 1
ax(1) = subplot(2,2,[1 2]); 
pl1(1) = plot(data_x,data_y1);
hold on
pl1(2) = plot(data_x,data_y2);
hold off
pl1(1).LineWidth = 2;
pl1(2).LineWidth = 2;
tl1 = title('example plot 1');
xl1 = xlabel('x values');
xlim([-pi pi])
xticks([-pi -0.5*pi 0 0.5*pi pi])
xticklabels({'-\pi','-0.5\pi','0','0.5\pi','\pi'})
yl1 = ylabel('y values');
ylim([-10 10])
yticks([-10 -5 0 5 10]) % by manually setting these, Matlab wont automatically change them when you resize
box off
ll1 = legend('Blue line','Red line');

% axes 2
ax(2) = subplot(2,2,3);
pl2 = bar(1:4,data_bars);
for i = 1:3
    pl2(i).LineStyle = 'none'; % turn off edges
end
tl2 = title('example plot 2');
xl2 = xlabel('groups');
xticklabels({'A','B','C','D'})
yl2 = ylabel('y_values');
yl2.Interpreter = 'none';
box off
ylim([0 30])
yticks([0 15 30])
ll2 = legend('Slow','Med','Fast');


% axes 3
ax(3) = subplot(2,2,4); 
pl3(1) = errorbar(data_time,data_means1,[],data_error1,'bo-');
hold on
pl3(2) = errorbar(data_time,data_means2,data_error2,[],'ro:');
hold off
pl3(1).LineWidth = 1;
pl3(2).LineWidth = 1; 
pl3(1).MarkerFaceColor = 'b';
pl3(2).MarkerFaceColor = 'w';
pl3(1).MarkerSize = 3;
pl3(2).MarkerSize = 3;
tl3 = title('example plot 3');
xl3 = xlabel('time (sec)');
xlim([0.5 5.5])
yl3 = ylabel('y_values','Interpreter','none');
ylim([0 10])
yticks([0 5 10])
ll3 = legend({'Top','Bottom'},'Location','southwest');
box off

% set font sizes
fsize = 7; % recommended artwork font size for Elsevier publications
ax(1).FontSize = fsize;
ax(2).FontSize = fsize;
ax(3).FontSize = fsize;


%% save figure

% set size of figure:
% goal is to get ~90mm wide (1 column), 140mm wide (1.5 column), 190mm wide (2 column)
fig.PaperUnits = 'centimeters'; 
fig.PaperPosition = [0 0 9.0 10 ];  % [left bottom width height]

filename = 'dummyFigure';
print(filename,'-depsc','-painters','-loose') % save as .eps in color (vector)
% print(filename,'-dpdf','-painters','-loose') % save as .pdf (vector)
% print(filename,'-dpng','-painters','-loose') % save as .png (raster)
% print(filename,'-djpeg','-painters','-loose') % save as .jpg (raster)