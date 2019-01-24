% Filename:	example3b_startupFile.m
% Author:	Samuel Acuna
% Date:		21 Jul 2015
% Subject:	Matlab Startup file
% About:	Example of a MatLab startup file. To use, rename this file as
%           'startup.m' and place it in the MatLab userpath directory. 
%
% In your startup file, Add commands you want executed when MatLabs first
% starts.
% Things you may want to include in your startup file: 
%   physical constants you use a lot
%   defaults for graphics properties
%   engineering conversion factors
%   anything else you want predefined in your workspace.

format compact; % so command window lines aren't widely spaced
disp('Welcome to MatLab! Good luck coding today!'); % welcome message

%% set figure preferences
disp('Default figure objects updated to my preferences. see startup.m')
% this changes Matlab's default settings for the current session.  
% if you restart Matlab, these changes are forgotten! 
%
% preferences set by modifying the root graphics handle. called "0" or "groot".
% note: "0" or "groot" are two different names for the same handle. 
%         "0" is used in older versions of matlab
%         "groot" is used in newer versions of matlab

% set default figure properties:
% see: https://www.mathworks.com/help/matlab/ref/matlab.ui.figure-properties.html
set(groot,'defaultFigureColor','w'); % white background
% set(groot,'defaultFigurePaperUnits','centimeters');
% set(groot,'defaultFigurePaperPosition',[0 0 9.0 10]);  % size of printed figure. [left bottom width height]

% set default axes properties:
% see: https://www.mathworks.com/help/matlab/ref/matlab.graphics.axis.axes-properties.html
set(groot,'DefaultAxesColor','none'); % axes doesnt have a background
set(groot,'DefaultAxesXColor','k'); % set axes color to true black
set(groot,'DefaultAxesYColor','k'); % set axes color to true black
% set(groot,'DefaultAxesLineWidth', 1); % set axes line width
set(groot,'DefaultAxesFontSize',7); % set axes font size
set(groot,'DefaultAxesFontSizeMode','manual'); % set axes font size
% set(groot,'DefaultAxesFontName','Arial'); % set font
set(groot,'DefaultAxesBox','off'); % turn off box border, but this overridden by plot command. see: https://www.mathworks.com/matlabcentral/answers/79229-set-0-defaultaxesbox-off-is-not-honored-by-plot

% set default Line properties:
% see: https://www.mathworks.com/help/matlab/ref/matlab.graphics.chart.primitive.line-properties.html
set(groot,'defaultLineMarkerSize',3); % set the line marker size
set(groot,'defaultLineLineWidth',2); % set the line width for plots

% set default Bar properties:
% see: https://www.mathworks.com/help/matlab/ref/matlab.graphics.chart.primitive.bar-properties.html
set(groot,'defaultBarLineStyle','none'); % no edges on bar plots

% set default ErrorBar properties:
% see: https://www.mathworks.com/help/matlab/ref/matlab.graphics.chart.primitive.errorbar-properties.html
set(groot,'defaultErrorBarMarkerFaceColor','auto'); % set as filled markers to match line color
set(groot,'defaultErrorBarMarkerSize',3); % set as filled markers to match line color

% set default Text properties:
% see: https://www.mathworks.com/help/matlab/ref/matlab.graphics.primitive.text-properties.html
set(groot,'defaultTextInterpreter','none'); % no LaTeX formatting


% you can look up more properties using:   
%   1. type: "inspect" to see figure inspector 
%   2. type: "get(0,'factory')" to see full list of stored factory defaults.
%      - look around 'factoryAxes...' and 'factoryFigure...' to get started
%      - can also try:
%           get(0,'factoryAxes');   % lists the relevant Axes properties
%           get(0,'factoryFigure'); % lists the relevant Figure properties
%           get(0,'factoryLine');   % lists the relevant line properties
%           get(0,'factoryBar');   % lists the relevant Bar properties
%           get(0,'default');       % lists your set default preferences
%   3. check out MatLab documentation online. 
%       
%       
%
% to RESET a value:
%   set(0,'DefaultFigureColor','factory');
% to RESET everything:
%   set(groot, 'Default', struct());
