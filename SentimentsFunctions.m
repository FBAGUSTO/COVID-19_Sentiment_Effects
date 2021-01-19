
 function SentimentsFunctions
clc
close all 
clear all
         
global  beta0 beta1 etaA etaQ etaH sigma gammaI gammaA gammaQ gammaH  
global  q deltaQ deltaH deltaI deltaA nuQ0 nuQ1
global  nuH0 nuH1 omegaQ1  omegaQ0 omegaH1 omegaH0 ap bp an bn
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fixed parameters
tf = 150;  
 

q = 0.6; 
sigma = 0.7;
gammaA = 0.13978;
gammaI = 1/10;
gammaQ = 1/10;
gammaH = 1/8;

%%%  Fitted parameters for before lockdown
etaQ = 0.1708; etaA = 0.5840; etaH = 0.5610; 
deltaA = 0.0100; deltaI = 0.0364; deltaQ = 0.0100; deltaH = 0.0100; 
beta0 = 0.7301; nuQ0 = 0.4637; nuH0 = 0.1820; omegaQ0 = 0.0854; omegaH0 = 0.0624; 
% Rc = 2.7462
                                            
%%%% Fitted parameters After lockdown
beta1 = 0.3603;  nuQ1 = 0.4367;  nuH1 = 0.1810;  omegaQ1 = 0.4580;  omegaH1 = 0.6873;                      
% Rc = 1.4953



%% initialize parameter space  

N0 = 67886011;   
E0 = 0/N0;   A0 = 0/N0;    I0 = 1/N0;     Q0 = 0/N0;
H0 = 0/N0;   R0 = 0/N0;

N0 = 67988148;
S0  = N0/N0 - (E0 + A0 + I0 + Q0 + H0 + R0);

%%%% United Kingdom 	
%%%% United Kingdom sentiment data
ap = 0.0012266; bp = 0.34568; an = -0.0002375; bn = 0.22246;

x0 = [S0; E0; A0; I0; Q0; H0; R0; 0];    

[t,y]=ode45(@Coronavirus,0:0.1:tf,x0);
S = max(0,y(:,1)); E = max(0,y(:,2)); 
A = max(0,y(:,3)); 
I = max(0,y(:,4));  Q = max(0,y(:,5)); H = max(0,y(:,6)); R = max(0,y(:,7));%  
CI = max(0,y(:,8).*N0)';  

%% ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NI = I + A + Q + H;
N = S0 + E0 + I0 + A0 + Q0 + H0 + R0;
max(N)

t=0:0.1:53;
yp = ap.*t + bp;
yn = an.*t + bn;
mm=((1/100000).*(yp-yn));  %

m_before =mean(mm) 


t=54:0.1:tf;
yp = ap.*t + bp;
yn = an.*t + bn;
mm=((1/100000).*(yp-yn));  

m_after=mean(mm) 

t=0:0.1:tf;
yp = ap.*t + bp;
yn = an.*t + bn;
mm=((1/100000).*(yp-yn));  %

m=mean(mm) 


C_u1=ones(1,length(NI));

beta = beta1 + (beta0-beta1).*exp(-m.*CI);
nuQM = nuQ1 + (nuQ0 - nuQ1).*exp(-m.*CI); 
nuHM = nuH1 + (nuH0 - nuH1 ).*exp(-m.*CI);
omegaQM = omegaQ1 + (omegaQ0 - omegaQ1).*exp(-m.*CI);
omegaHM = omegaH1 + (omegaH0 -  omegaH1).*exp(-m.*CI);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(0,'DefaultAxesFontSize',18)  
FS = 18;  

figure(100)
% box on;
hold on;
plot(t,beta,'-','LineWidth', 3,'Color',[1 0 0]); % red
plot(t,min(beta)*C_u1-0.00002,'--','LineWidth',2, 'Color',[.0 .0 .0]);
plot(t,0.00002+max(beta)*C_u1,'--','LineWidth',2, 'Color',[.0 .0 .0]);
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 5, 4]);
set(gca, 'FontSize', FS)
ax = gca;
ax.TickLabelInterpreter = 'latex';
xlabel('Time (days)', 'Interpreter', 'latex')
ylabel('$\beta_M$', 'Interpreter', 'latex')
axis([0 tf (min(beta)-0.00005) (max(beta)+0.00005)])
 

figure(101) %
hold on;
plot(t,nuQM,'-','LineWidth', 3,'Color',[0.8 0 0.5]); % red 
plot(t,min(nuQM)*C_u1-0.00002,'--','LineWidth',2, 'Color',[.0 .0 .0]);
plot(t,0.00002+max(nuQM)*C_u1,'--','LineWidth',2, 'Color',[.0 .0 .0]);
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 5, 4]);
set(gca, 'FontSize', FS)
ax = gca;
ax.TickLabelInterpreter = 'latex';
xlabel('Time (days)', 'Interpreter', 'latex')
ylabel('$\nu_{QM}$', 'Interpreter', 'latex')
% ylabel('\nu_Q_M ' ,'FontSize',20)
axis([0 tf (min(nuQM)-0.00005) (max(nuQM)+0.00005)])


figure(102) %
hold on;
plot(t,nuHM,'-','LineWidth', 3,'Color',[1 0.5 0]); % yellow
plot(t,min(nuHM)*C_u1-0.00002,'--','LineWidth',2, 'Color',[.0 .0 .0]);
plot(t,0.00002+max(nuHM)*C_u1,'--','LineWidth',2, 'Color',[.0 .0 .0]);
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 5, 4]);
set(gca, 'FontSize', FS)
ax = gca;
ax.TickLabelInterpreter = 'latex';
xlabel('Time (days)', 'Interpreter', 'latex')
ylabel('$\nu_{HM}$', 'Interpreter', 'latex')
axis([0 tf (min(nuHM)-0.00005) (max(nuHM)+0.00005)])


figure(103) %
hold on;
plot(t,omegaQM,'-','LineWidth', 3,'Color',[0 0.5 0]); % green  
plot(t,min(omegaQM)*C_u1-0.00002,'--','LineWidth',2, 'Color',[.0 .0 .0]);
plot(t,0.00002+max(omegaQM)*C_u1,'--','LineWidth',2, 'Color',[.0 .0 .0]);
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 5, 4]);
set(gca, 'FontSize', FS)
ax = gca;
ax.TickLabelInterpreter = 'latex';
xlabel('Time (days)', 'Interpreter', 'latex')
ylabel('$\omega_{QM}$', 'Interpreter', 'latex')
axis([0 tf (min(omegaQM)-0.00005) (max(omegaQM)+0.00005)])


figure(104) %
hold on;
plot(t,omegaHM,'-','LineWidth', 3,'Color',[0 0.5 1]); % blue 
plot(t,min(omegaHM)*C_u1-0.00002,'--','LineWidth',2, 'Color',[.0 .0 .0]);
plot(t,0.00002+max(omegaHM)*C_u1,'--','LineWidth',2, 'Color',[.0 .0 .0]);
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 5, 4]);
set(gca, 'FontSize', FS)
ax = gca;
ax.TickLabelInterpreter = 'latex';
xlabel('Time (days)', 'Interpreter', 'latex')
ylabel('$\omega_{HM}$', 'Interpreter', 'latex')
axis([0 tf (min(omegaHM)-0.00005) (max(omegaHM)+0.00005)])


figure(105) %
hold on;
plot(t,mm,'-','LineWidth', 2,'Color',[0 0.5 0]); % green 
plot(t,min(mm)*C_u1-0.00002,'--','LineWidth',2, 'Color',[.0 .0 .0]);
plot(t,0.00002+max(mm)*C_u1,'--','LineWidth',2, 'Color',[.0 .0 .0]);
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 5, 4]);
set(gca, 'FontSize', FS)
ax = gca;
ax.TickLabelInterpreter = 'latex';
xlabel('Time (days)', 'Interpreter', 'latex')
ylabel('$m$', 'Interpreter', 'latex')
axis([0 tf (min(mm)-0.00005) (max(mm)+0.00005)])


    
function dydt = Coronavirus(t,y)
   
global  beta0 beta1 etaA etaQ etaH sigma gammaI gammaA gammaQ gammaH    
global  q deltaQ deltaH deltaI deltaA nuQ0 nuQ1
global  nuH0 nuH1 omegaQ1 omegaQ0 omegaH1 omegaH0 ap bp an bn


S = max(0,y(1)); E = max(0,y(2)); A = max(0,y(3)); I = max(0,y(4));
Q = max(0,y(5)); H = max(0,y(6)); R = max(0,y(7));   CI = max(0,y(8)); 
    
N = S+E+A+I+Q+H+R;   
NI = I + A + Q + H;

yp = ap*t + bp;
yn = an*t + bn;

m=(0.00001* (yp-yn));  %  (1/100000).* 


beta = beta1 +(beta0-beta1).*exp(-m.*CI);
nuQM = nuQ1 + (nuQ0 - nuQ1).*exp(-m.*CI); 
nuHM = nuH1 +(nuH0 - nuH1 ).*exp(-m.*CI);
omegaQM = omegaQ1 +(omegaQ0 - omegaQ1).*exp(-m.*CI);
omegaHM = omegaH1 + (omegaH0 -  omegaH1).*exp(-m.*CI);


lambda1=(beta*I)/N;
lambda2=(beta*etaA*A)/N;
lambdaQ=(beta*etaQ*Q)/N;
lambdaH=(beta*etaH*H)/N; 

lambda = lambda1+lambda2+lambdaQ+lambdaH;
 
dS = - lambda*S;
dE = lambda*S - sigma*E;
dA = q*sigma*E - gammaA*A - deltaA*A;  
dI = (1-q)*sigma*E+ nuQM*Q + nuHM*H - omegaQM*I - omegaHM*I - gammaI*I - deltaI*I;
dQ = omegaQM*I - nuQM*Q - gammaQ*Q - deltaQ*Q;   
dH = omegaHM*I - nuHM*H - gammaH*H - deltaH*H;   

dR = gammaI*I + gammaA*A + gammaQ*Q + gammaH*H +deltaI*I+deltaA*A+deltaQ*Q+deltaH*H;

dCI = (1-q)*sigma*E; 
  
dydt = [dS; dE; dA; dI; dQ; dH; dR; dCI] ;
