

tf = 150;   
t = 0:0.1:tf;


%%%% Australia
ap = 0.0012461; bp = 0.32225; an = -0.00016767; bn = 0.21212;
% Equation for positive sentiment:  y_p = 0.0012461*x + 0.32225
% Equation for negative sentiment:  y_n = -0.00016767*x + 0.21212
% Equation for positive sentiment:  y_p = 0.0012461*x + 0.32225
% Equation for negative sentiment:  y_n = 0.00016767*x + -0.21212

yp = ap*t + bp;
yn = an*t + bn;
m_AU = yp-yn;


%%%% Brazil sentiment data
ap =  0.00032631; bp =  0.18091; an =  0.00022551; bn =  0.11779;
% Equation for positive sentiment:  y_p = 0.00032631*x + 0.18091
% Equation for negative sentiment:  y_n = 0.00022551*x + 0.11779
% Equation for positive sentiment:  y_p = 0.00032631*x + 0.18091
% Equation for negative sentiment:  y_n = -0.00022551*x + -0.11779


yp = ap*t + bp;
yn = an*t + bn;
m_BR = yp-yn;
 

%%%% India sentiment data
ap = 5.062e-05; bp = 0.33413; an = -0.00024183; bn = 0.16858;
% Equation for positive sentiment:  y_p = 5.062e-05*x + 0.33413
% Equation for negative sentiment:  y_n = -0.00024183*x + 0.16858
% Equation for positive sentiment:  y_p = 5.062e-05*x + 0.33413
% Equation for negative sentiment:  y_n = 0.00024183*x + -0.16858

yp = ap*t + bp;
yn = an*t + bn;
m_IN = yp-yn; 


%%%% Italy sentiment data
ap = 0.00054929; bp = 0.24898; an = -0.00030907; bn = 0.16079;
% Equation for positive sentiment:  y_p = 0.00054929*x + 0.24898
% Equation for negative sentiment:  y_n = -0.00030907*x + 0.16079
% Equation for positive sentiment:  y_p = 0.00054929*x + 0.24898
% Equation for negative sentiment:  y_n = 0.00030907*x + -0.16079

yp = ap*t + bp;
yn = an*t + bn;
m_IY = yp-yn;



% %%%% Nigeria sentiment data
ap = 0.00064025; bp = 0.30729; an = 0.00030552; bn = -0.18001;

% Equation for positive sentiment:  y_p = 0.00064025*x + 0.30729
% Equation for negative sentiment:  y_n = 0.00030552*x + -0.18001
% Equation for positive sentiment:  y_p = 0.00064025*x + 0.30729
% Equation for negative sentiment:  y_n = -0.00030552*x + 0.18001

yp = ap*t + bp;
yn = an*t + bn;
m_NG = yp-yn;


%%%%% South Africa sentiment data
ap = 0.0005727; bp = 0.26629; an = -0.00026964; bn = 0.18524;
% Equation for positive sentiment:  y_p = 0.0005727*x + 0.26629
% Equation for negative sentiment:  y_n = -0.00026964*x + 0.18524
% Equation for positive sentiment:  y_p = 0.0005727*x + 0.26629
% Equation for negative sentiment:  y_n = 0.00026964*x + -0.18524

yp = ap*t + bp;
yn = an*t + bn;
m_SA = yp-yn;


%%%% United Kingdom sentiment data
ap = 0.0012266; bp = 0.34568; an = -0.0002375; bn = 0.22246;
% Equation for positive sentiment:  y_p = 0.0012266*x + 0.34568
% Equation for negative sentiment:  y_n = -0.0002375*x + 0.22246
% Equation for positive sentiment:  y_p = 0.0012266*x + 0.34568
% Equation for negative sentiment:  y_n = 0.0002375*x + -0.22246

yp = ap*t + bp;
yn = an*t + bn;
m_UK = yp-yn;


%%%% United States sentiment data
ap = 0.00029309; bp = 0.10708; an = 5.5321e-06; bn = 0.067976;
ap = 0.00029309; bp = 0.10708; an2 = 5.5321e-06*1.2; bn2 = 0.067976*1.2;

% Equation for positive sentiment:  y_p = 0.00029309*x + 0.10708
% Equation for negative sentiment:  y_n = 5.5321e-06*x + 0.067976

% Equation for positive sentiment:  y_p = 0.00029309*x + 0.10708
% Equation for negative sentiment:  y_n = -5.5321e-06*x + -0.067976

yp = ap*t + bp;
yn = an*t + bn;
yn2 = an2*t + bn2;

m_US = yp-yn;
m_US2 = yp-yn2;


%
%t,m_US2,'--k',

% figure(3)
% plot(t,m_AU,'-.b',t,m_BR,'-.k',t,m_IY,'r',t,m_IN,'-.g',t,m_NG,'c',t,m_SA,'-.r',t,m_UK,'b',t,m_US,'k','LineWidth',3)
% xlabel('Time (days)','FontSize',25)
% ylabel('m = yp+yn','FontSize',25)
% legend('Australia','Brazil','Italy','India','Nigeria','South Africa','United Kingdom','United States')    





set(0,'DefaultAxesFontSize',20)

FS = 15;  % font size for graphs

printTOeps = true;  % if true, the figures will be printed to EPS files

figure(2)
box on;
hold on;
plot(t, m_AU, 'LineWidth', 2, 'Color', [0 0 1]);  % blue 
plot(t, m_BR, '--', 'LineWidth', 2, 'Color', [0 0.5 0]); % green
plot(t, m_IY, 'LineWidth', 2, 'Color', [1 0 0]); % red
plot(t, m_SA, '--', 'LineWidth', 2, 'Color', [1 0 0]); % red
plot(t, m_UK, '--', 'LineWidth', 2, 'Color', [0 0 1]); % blue 
plot(t, m_US, 'LineWidth', 2, 'Color', [0 0.5 0]); % green
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 4, 3]);
set(gca, 'FontSize', FS)
ax = gca;
ax.TickLabelInterpreter = 'latex';
xlabel('Time (days)', 'Interpreter', 'latex')
ylabel('Sentiment difference ', 'Interpreter', 'latex')
legend('Australia','Brazil','Italy','South Africa','United Kingdom','United States', ...
    'Interpreter', 'latex');
legend boxoff
% axis([0 tf 0 0.017]);

% if printTOeps
%     filename = 'populationomegaQHbehavior.eps';
%     print(filename,'-depsc');
% %     close
% end













