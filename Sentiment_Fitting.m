
clc
close all
clear all

FS = 23;  % font size for graphs

printTOeps = true;  % if true, the figures will be printed to EPS files


% data = load('AustraliaSentiments.txt'); 
% data = load('BrazilSentiments.txt');   
% data = load('ItalySentiments.txt'); 
data = load('SouthAfricaSentiments.txt');   
% data = load('UKSentiments.txt'); 
% data = load('USSentiments.txt'); 

Times = 1:1:length(data(:,2));
dataCasesPositive = data(:,2);     
dataCasesNegative = -data(:,3);

%%% Australia
% Equation for positive sentiment:  y_p = 0.0012461*x + 0.32225
% Equation for negative sentiment:  y_n = 0.00016767*x + -0.21212

%%% Brazil
% Equation for positive sentiment:  y_p = 0.00032631*x + 0.18091
% Equation for negative sentiment:  y_n = -0.00022551*x + -0.11779

% Equation for positive sentiment:  y_p = 0.00032631*x + 0.18091
% Equation for negative sentiment:  y_n = 0.00022551*x + 0.11779

%%% Italy
% Equation for positive sentiment:  y_p = 0.00054929*x + 0.24898
% Equation for negative sentiment:  y_n = 0.00030907*x + -0.16079

%%% South Africa 
% Equation for positive sentiment:  y_p = 0.0005727*x + 0.26629
% Equation for negative sentiment:  y_n = 0.00026964*x + -0.18524

% Equation for positive sentiment:  y_p = 0.0005727*x + 0.26629
% Equation for negative sentiment:  y_n = -0.00026964*x + 0.18524
 
%%% UK
% Equation for positive sentiment:  y_p = 0.0012266*x + 0.34568
% Equation for negative sentiment:  y_n = 0.0002375*x + -0.22246

%%% US
% Equation for positive sentiment:  y_p = 0.00029309*x + 0.10708
% Equation for negative sentiment:  y_n = -5.5321e-06*x + -0.067976

% Fit line to data using polyfit
c_Positive = polyfit(Times',dataCasesPositive,1);%
% Display evaluated equation y = m*x + b
disp(['Equation for positive sentiment:  y_p = ' num2str(c_Positive(1)) '*x + ' num2str(c_Positive(2))])
% Evaluate fit equation using polyval
Cases_Positive_est = polyval(c_Positive,Times);


% Fit line to data using polyfit
c_Negative = polyfit(Times',dataCasesNegative,1);%
% Display evaluated equation y = m*x + b
disp(['Equation for negative sentiment:  y_n = ' num2str(c_Negative(1)) '*x + ' num2str(c_Negative(2))])
% Evaluate fit equation using polyval
Cases_Negative_est = polyval(c_Negative,Times);


% Australia_UK_US_Dates = {'1/22/2020','1/23/2020','1/24/2020','1/25/2020','1/26/2020','1/27/2020',...
% '1/28/2020','1/29/2020','1/30/2020','1/31/2020',...
% '2/1/2020','2/2/2020','2/3/2020','2/4/2020','2/5/2020','2/6/2020','2/7/2020','2/8/2020',...
% '2/9/2020','2/10/2020','2/11/2020','2/12/2020','2/13/2020','2/14/2020','2/15/2020','2/16/2020',...
% '2/17/2020','2/18/2020','2/19/2020','2/20/2020','2/21/2020','2/22/2020','2/23/2020','2/24/2020',...
% '2/25/2020','2/26/2020','2/27/2020','2/28/2020','2/29/2020',...
% '3/1/2020','3/2/2020','3/3/2020','3/4/2020','3/5/2020','3/6/2020','3/7/2020','3/8/2020','3/9/2020',...
% '3/10/2020','3/11/2020','3/12/2020','3/13/2020','3/14/2020','3/15/2020','3/16/2020','3/17/2020',...
% '3/18/2020','3/19/2020','3/20/2020','3/21/2020','3/22/2020','3/23/2020','3/24/2020','3/25/2020',...
% '3/26/2020','3/27/2020','3/28/2020','3/29/2020','3/30/2020','3/31/2020',...
% '4/1/2020','4/2/2020','4/3/2020','4/4/2020','4/5/2020','4/6/2020','4/7/2020','4/8/2020','4/9/2020', ...
% '4/10/2020','4/11/2020','4/12/2020','4/13/2020','4/14/2020','4/15/2020','4/16/2020','4/17/2020',...
% '4/18/2020','4/19/2020','4/20/2020','4/21/2020','4/22/2020','4/23/2020','4/24/2020','4/25/2020',...
% '4/26/2020','4/27/2020','4/28/2020','4/29/2020','4/30/2020',...
% '5/1/2020','5/2/2020','5/3/2020','5/4/2020','5/5/2020','5/6/2020','5/7/2020','5/8/2020','5/9/2020',...
% '5/10/2020','5/11/2020','5/12/2020','5/13/2020','5/14/2020','5/15/2020','5/16/2020','5/17/2020',...
% '5/18/2020','5/19/2020','5/20/2020','5/21/2020','5/22/2020','5/23/2020','5/24/2020','5/25/2020',...
% '5/26/2020','5/27/2020','5/28/2020','5/29/2020'};

% Dates=datenum(Australia_UK_US_Dates, 'mm/dd/yyyy');             


Brazil_Italy_SouthAfrica_Dates = {'1/23/20','1/24/20','1/25/20','1/26/20','1/27/20',...
'1/28/20','1/29/20','1/30/20','1/31/20',...
'2/1/20','2/2/20','2/3/20','2/4/20','2/5/20','2/6/20','2/7/20','2/8/20',...
'2/9/20','2/10/20','2/11/20','2/12/20','2/13/20','2/14/20','2/15/20','2/16/20',...
'2/17/20','2/18/20','2/19/20','2/20/20','2/21/20','2/22/20','2/23/20','2/24/20',...
'2/25/20','2/26/20','2/27/20','2/28/20','2/29/20',...
'3/1/20','3/2/20','3/3/20','3/4/20','3/5/20','3/6/20','3/7/20','3/8/20','3/9/20',...
'3/10/20','3/11/20','3/12/20','3/13/20','3/14/20','3/15/20','3/16/20','3/17/20',...
'3/18/20','3/19/20','3/20/20','3/21/20','3/22/20','3/23/20','3/24/20','3/25/20',...
'3/26/20','3/27/20','3/28/20','3/29/20','3/30/20','3/31/20',...
'4/1/20','4/2/20','4/3/20','4/4/20','4/5/20','4/6/20','4/7/20','4/8/20','4/9/20', ...
'4/10/20','4/11/20','4/12/20','4/13/20','4/14/20','4/15/20','4/16/20','4/17/20',...
'4/18/20','4/19/20','4/20/20','4/21/20','4/22/20','4/23/20','4/24/20','4/25/20',...
'4/26/20','4/27/20','4/28/20','4/29/20','4/30/20',...
'5/1/20','5/2/20','5/3/20','5/4/20','5/5/20','5/6/20','5/7/20','5/8/20','5/9/20',...
'5/10/20','5/11/20','5/12/20','5/13/20','5/14/20','5/15/20','5/16/20','5/17/20',...
'5/18/20','5/19/20','5/20/20','5/21/20','5/22/20','5/23/20','5/24/20','5/25/20',...
'5/26/20','5/27/20','5/28/20','5/29/20'};

Dates=datenum(Brazil_Italy_SouthAfrica_Dates, 'mm/dd/yy');


set(0,'DefaultAxesFontSize',20)



FS = 13;  % font size for graphs

printTOeps = true;  % if true, the figures will be printed to EPS files

figure(2)
box on;
hold on; %
plot(Times,dataCasesPositive,'-sb','LineWidth', 2)
plot(Times,dataCasesNegative,'-sr','LineWidth', 2) 
plot(Times,Cases_Positive_est,'-','LineWidth',2, 'Color',[1 0 1]); % green 
plot(Times,Cases_Negative_est,'-','LineWidth',2, 'Color',[.0 .0 .0]);  % green
axis([0 length(data(:,2)), -0.52 0.64]) 

% title('Australia')
% title('Brazil')
% title('Italy')
title('South Africa')
% title('United Kingdom')
% title('United States')
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 7, 5]);
set(gca, 'FontSize', FS)
ax = gca;
ax.TickLabelInterpreter = 'latex';
ylabel('Twitter tweets sentiment values', 'Interpreter', 'latex')
legend('Positive Sentiment','Negative Sentiment', ...
    'Interpreter', 'latex');
set(gca, 'FontSize', 18); 
datetick('x','mm/dd', 'keepticks','keeplimits') 
legend boxoff





