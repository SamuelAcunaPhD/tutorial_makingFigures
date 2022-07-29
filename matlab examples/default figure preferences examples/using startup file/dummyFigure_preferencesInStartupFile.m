% Filename: dummyFigure_preferencesInStartupFile.m
% Author:   Samuel Acuña
% Date:     23 Jan 2019
% Description: An example of how to easily format figures in Matlab, and
% then export them into a vector image format. This version assumes figure
% preferences have been established in a startup.m file.
%
% NOTE: This example was created using MatLab R2018a

% This example works when you have a MatLab startup.m file, that sets your
% figure preferences for the duration of your matlab session.
%
% STEP 1: change name of file "example3b_startupFile.m" to "startup.m"
% STEP 2: place "startup.m" in your MatLab search path. probably the first main folder in the path.
% STEP 3: restart MatLab, or type: >> startup
%
% now, everytime you start MatLab your "startup.m" file automatically
% executes.
%
% keep in mind: 
%   1. to rerun your startup file, just type: >> startup
%   2. to reset the graphics root handle to factory defaults, 
%      just type: >> set(groot, 'Default', struct());
%      but it will reload your preferences every time you start MatLab
%

clear; close all; clc;

%% dummy data, same as before

data_x = -pi:0.01:pi;
data_y1 = 5*sin(data_x); 
data_y2 = sin(10*data_x)-1.5*data_x;

data_bars = [5*rand(4,1) + 10, 10*rand(4,1) + 12, 4*rand(4,1) + 5];

data_time = [1:5];
data_means1 = 3*rand(5,1)+5;
data_error1 = 2*rand(5,1);
data_means2 = 2*rand(5,1)+4;
data_error2 = 3*rand(5,1);

%% plot dummy data, but dont need to specify preferences beforehand
% note: I use Handles for most elements of my plots, in case I need to go
% back and adjust their properties. Not all will be used in this example.
% If you need to pull a handle for pervious plots, try : 
%   h = get(ax(3), 'children'); % pull handles of lines

% create a figure
fig = figure(); 

% axes 1
ax(1) = subplot(2,2,[1 2]); 
pl1(1) = plot(data_x,data_y1);
hold on
pl1(2) = plot(data_x,data_y2);
hold off
tl1 = title('example plot 1');
xl1 = xlabel('x values');
yl1 = ylabel('y values');
xticks([-pi -0.5*pi 0 0.5*pi pi])
xticklabels({'-\pi','-0.5\pi','0','0.5\pi','\pi'})
ll1 = legend('Blue line','Red line');

% axes 2
ax(2) = subplot(2,2,3);
pl2 = bar(1:4,data_bars);
tl2 = title('example plot 2');
xl2 = xlabel('groups');
xticklabels({'A','B','C','D'})
yl2 = ylabel('y_values');

% axes 3
ax(3) = subplot(2,2,4); 
pl3(1) = errorbar(data_time,data_means1,[],data_error1,'bo-');
hold on
pl3(2) = errorbar(data_time,data_means2,data_error2,[],'ro:');
hold off
tl3 = title('example plot 3');
xl3 = xlabel('time (sec)');
yl3 = ylabel('y_values','Interpreter','none');

% At this point the figure doesnt look publication worthy. 
% Let's try to clean it up a bit.

%% clean up figure
fig.Name = 'example figure';

% still need to specifcy axis limits
axes(ax(1)); % set focus
xlim([-pi pi])
ylim([-10 10])
yticks([-10 -5 0 5 10]) % by manually setting these, Matlab wont automatically change them when you resize
box off % tried to set preference for box off, but this overridden by plot command. see: https://www.mathworks.com/matlabcentral/answers/79229-set-0-defaultaxesbox-off-is-not-honored-by-plot


axes(ax(2)); % set focus
ll2 = legend('Slow','Med','Fast');
ylim([0 30])
yticks([0 15 30])
box off

axes(ax(3)); % set focus
pl3(2).MarkerFaceColor = 'w';
ll3 = legend({'Top','Bottom'},'Location','southwest');
ylim([0 10])
yticks([0 5 10])
xlim([0.5 5.5])
box off


%% save figure

% % set size of figure:
% % goal is to get ~90mm wide (1 column), 140mm wide (1.5 column), 190mm wide (2 column)
% fig.PaperUnits = 'centimeters'; 
% fig.PaperPosition = [0 0 9.0 10 ];  % [left bottom width height]
% 
% filename = 'example2_figure';
% print(filename,'-depsc','-painters','-loose') % save as .eps in color (vector)
% % print(filename,'-dpdf','-painters','-loose') % save as .pdf (vector)
% % print(filename,'-dpng','-painters','-loose') % save as .png (raster)
% % print(filename,'-djpeg','-painters','-loose') % save as .jpg (raster)





