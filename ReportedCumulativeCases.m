

clc

dataCasesAU = load('AustraliaCases.txt'); 
dataCasesBR = load('BrazilCases.txt');   
dataCasesIN = load('IndiaCases.txt'); 
dataCasesIY = load('ItalyCases.txt'); 
dataCasesNG = load('NigeriaCases.txt');   
dataCasesSA = load('SouthAfricaCases.txt');   
dataCasesUK = load('UKCases.txt'); 
dataCasesUS = load('USCases.txt'); 

TimesAU = 1:1:length(dataCasesAU(:,1));
TimesBR = 1:1:length(dataCasesBR(:,1));
TimesIY = 1:1:length(dataCasesIY(:,1));
TimesSA = 1:1:length(dataCasesSA(:,1));
TimesUK = 1:1:length(dataCasesUK(:,1));
TimesUS = 1:1:length(dataCasesUS(:,1));

CasesAU = dataCasesAU(:,2);
CasesBR = dataCasesBR(:,2);
CasesIY = dataCasesIY(:,2);
CasesSA = dataCasesSA(:,2);
CasesUK = dataCasesUK(:,2);
CasesUS = dataCasesUS(:,2);


FS = 13;  % font size for graphs

set(0,'DefaultAxesFontSize',25)  



% figure(11)
% box on;
% hold on;
% plot(,'-.','LineWidth',2, 'Color', [0 0 1]); 
% plot('-.','LineWidth',2, 'Color', [0 0.5 0]); 
% plot('-','LineWidth',2, 'Color', [1 0 0]); 
% plot('-.','LineWidth',2, 'Color', [1 0 0]);  
% plot('LineWidth',2, 'Color', [0 0 1]); 
% plot('LineWidth',2, 'Color', [0 0.5 0]); 
% set(gcf, 'Units', 'Inches', 'Position', [0, 0, 4.5, 3]);
% set(gca, 'FontSize', FS)
% ax = gca;
% ax.TickLabelInterpreter = 'latex';
% xlabel('Days since first case', 'Interpreter', 'latex')
% ylabel('Infected population', 'Interpreter', 'latex')
% legend('Australia','Brazil','Italy','South Africa','United Kingdom','United States', ...
%     'Interpreter', 'latex');
% legend boxoff

figure(11)
box on;
hold on; 
plot(TimesAU,CasesAU, 'LineWidth', 2, 'Color', [0 0 1]);  % blue 
plot(TimesBR,CasesBR, '--', 'LineWidth', 2, 'Color', [0 0.5 0]); % green
plot(TimesIY,CasesIY, 'LineWidth', 2, 'Color', [1 0 0]); % red
plot(TimesSA,CasesSA, '--', 'LineWidth', 2, 'Color', [1 0 0]); % red
plot(TimesUK,CasesUK, '--', 'LineWidth', 2, 'Color', [0 0 1]); % blue 
plot(TimesUS,CasesUS, 'LineWidth', 2, 'Color', [0 0.5 0]); % green
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 4.5, 3]);
set(gca, 'FontSize', FS)
ax = gca;
ax.TickLabelInterpreter = 'latex';
xlabel('Days since first case', 'Interpreter', 'latex')
ylabel('Cumulative reported cases', 'Interpreter', 'latex')  
legend('Australia','Brazil','Italy','South Africa','United Kingdom','United States', ...
    'Interpreter', 'latex');  
legend boxoff

