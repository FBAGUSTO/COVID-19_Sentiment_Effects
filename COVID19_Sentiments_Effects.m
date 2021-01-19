
 function COVID19_Sentiments_Effects
clc
close all 
clear all
         
global  beta0 beta1 etaA etaQ etaH sigma gammaI gammaA gammaQ gammaH  
global  q deltaQ deltaH deltaI deltaA nuQ0 nuQ1
global  nuH0 nuH1 omegaQ1  omegaQ0 omegaH1 omegaH0 ap bp an bn
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%/2/2
q =  0.6;  sigma = 0.7; gammaA = 0.13978; gammaI = 1/10; gammaQ = 1/10; gammaH = 1/8;

tf = 150;  365;  200;   250;  350; 300;   
% %% Fixed parameters
% tf = 150;  
%  
% q = 0.6; 
% sigma = 0.7;
% gammaA = 0.13978;
% gammaI = 1/10;
% gammaQ = 1/10;
% gammaH = 1/8;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Australia 	
%Fitted parameters for before lockdown
beta0 = 0.7484;    etaQ = 0.5221;      etaA = 0.4500;     etaH = 0.7604; 
deltaA = 0.0100;    deltaI = 0.0100;    deltaQ = 0.0100;    deltaH = 0.0100;          
nuQ0 = 0.2463;      nuH0 = 0.1999;      omegaQ0 = 0.4530;    omegaH0 = 0.1976; 
% Rc = 3.2981

%%%% After lockdown
 beta1 = 0.1419;    nuQ1 = 0.2346;      nuH1 = 0.1200;      omegaQ1 = 0.4630;    omegaH1 = 0.3797; 
%  Rc = 0.6062

%%%% Australia sentiment data
ap = (100000).*0.0012461; bp = (100000).*0.32225; an = (100000).*(-0.00016767); bn = (100000).*0.21212;
 
N0_AU = 9006398;  
E0 = 0.0/N0_AU; A0 = 10.00/N0_AU; I0 = 10.00/N0_AU; Q0 = 0.00/N0_AU; H0 = 0.00/N0_AU; R0 = 0.00/N0_AU;    
S0 = N0_AU/N0_AU- E0-A0-I0-Q0-H0-R0;

x0 = [S0; E0; A0; I0; Q0; H0; R0; 0];        
[t,y]=ode15s(@Coronavirus,0:0.1:tf,x0);
S_AU = max(0,y(:,1)); E_AU = max(0,y(:,2)); 
A_AU = max(0,y(:,3)); 
I_AU = max(0,y(:,4));  Q_AU = max(0,y(:,5)); H_AU = max(0,y(:,6)); R_AU = max(0,y(:,7));%  
CI_AU = max(0,y(:,8)).*N0_AU; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% %%%% Brazil 	
%Fitted parameters for before lockdown
beta0 = 0.7650;    etaQ = 0.3110;      etaA = 0.4000;     etaH = 0.4773; 
deltaA = 0.0100;    deltaI = 0.0127;    deltaQ = 0.0100;    deltaH = 0.0100;          
nuQ0 = 0.1463;      nuH0 = 0.1301;      omegaQ0 = 0.4751;    omegaH0 = 0.1000; 
% Rc = 1.6557

%%%% After lockdown
beta1 = 0.5479;    nuQ1 = 0.1123;      nuH1 = 0.1112;      omegaQ1 = 0.4783;    omegaH1 = 0.2821; 
% Rc =  1.8413
   
% %%%% Brazil sentiment data
ap =  (100000).*0.00032631; bp =  (100000).*0.18091; an =  (100000).*0.00022551; bn =  (100000).*0.11779;

N0_BR = 212559417;  
E0 = 0.0/N0_BR; A0 = 10.00/N0_BR; I0 = 10.00/N0_BR; Q0 = 0.00/N0_BR; H0 = 0.00/N0_BR; R0 = 0.00/N0_BR;    
S0 = N0_BR./N0_BR - E0-A0-I0-Q0-H0-R0;
x0 = [S0; E0; A0; I0; Q0; H0; R0; 0];    
    
[t,y]=ode15s(@Coronavirus,0:0.1:tf,x0);
S_BR = max(0,y(:,1)); E_BR = max(0,y(:,2)); 
A_BR = max(0,y(:,3)); 
I_BR = max(0,y(:,4));  Q_BR = max(0,y(:,5)); H_BR = max(0,y(:,6)); R_BR = max(0,y(:,7));%  
CI_BR = max(0,y(:,8)).*N0_BR; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%% Italy 	
%Fitted parameters for before lockdown
beta0 = 0.6498;    etaQ = 0.3216;      etaA = 0.4500;     etaH = 0.7800; 
deltaA = 0.0100;    deltaI = 0.0100;    deltaQ = 0.0100;    deltaH = 0.0100;          
nuQ0 = 0.1500;      nuH0 = 0.1301;      omegaQ0 = 0.4751;    omegaH0 = 0.2800; 
% Rc = 2.9487

%%%% After lockdown
beta1 = 0.2777;    nuQ1 = 0.1350;      nuH1 = 0.1134;      omegaQ1 = 0.5471;    omegaH1 = 0.5873; 
% Rc = 1.0869

%%%% Italy sentiment data
ap = (100000).*0.00054929; bp = (100000).* 0.24898; an = (100000).*(-0.00030907); bn = (100000).*0.16079;

N0_IY = 60461826;  
E0 = 0.0/N0_IY; A0 = 10.00/N0_IY; I0 = 10.00/N0_IY; Q0 = 0.00/N0_IY; H0 = 0.00/N0_IY; R0 = 0.00/N0_IY;    
S0 = N0_IY/N0_IY- E0-A0-I0-Q0-H0-R0;
x0 = [S0; E0; A0; I0; Q0; H0; R0; 0];    

[t,y]=ode15s(@Coronavirus,0:0.1:tf,x0);
S_IY = max(0,y(:,1)); E_IY = max(0,y(:,2)); 
A_IY = max(0,y(:,3)); 
I_IY = max(0,y(:,4));  Q_IY = max(0,y(:,5)); H_IY = max(0,y(:,6)); R_IY = max(0,y(:,7));%  
CI_IY = max(0,y(:,8)).*N0_IY; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% %%%% South Africa 
%Fitted parameters for before lockdown
beta0 = 0.5000;      etaQ = 0.8300;         etaA = 0.8100;   etaH = 0.8100;    
deltaA = 0.0728;    deltaI = 0.0300;       deltaQ = 0.0100;    deltaH = 0.0100;            
nuQ0 = 0.5400;      nuH0 = 0.3180;      omegaQ0 = 0.4501;    omegaH0 = 0.1901; 
% Rc = 4.0487

%%%% Fitted parameters After lockdown
beta1 = 0.3109;    nuQ1 = 0.4000;      nuH1 = 0.1000;      omegaQ1 = 0.5100;    omegaH1 = 0.2500; 
% Rc =  1.5833
            
%%%%% South Africa sentiment data
ap = (100000).*0.0005727; bp = (100000).*0.26629; an = (100000).*(-0.00026964); bn = (100000).*0.18524;

N0_SA = 59308690;  
E0 = 0.0/N0_SA; A0 = 10.00/N0_SA; I0 = 10.00/N0_SA; Q0 = 0.00/N0_SA; H0 = 0.00/N0_SA; R0 = 0.00/N0_SA;    
S0 = N0_SA/N0_SA- E0-A0-I0-Q0-H0-R0;
x0 = [S0; E0; A0; I0; Q0; H0; R0; 0];    

[t,y]=ode15s(@Coronavirus,0:0.1:tf,x0);
S_SA = max(0,y(:,1));  E_SA = max(0,y(:,2)); 
A_SA = max(0,y(:,3)); 
I_SA = max(0,y(:,4));  Q_SA = max(0,y(:,5)); H_SA = max(0,y(:,6)); R_SA = max(0,y(:,7));%  
CI_SA = max(0,y(:,8)).*N0_SA; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%% United Kingdom 	

% %%%%%%%%%%%%%%    Before Lockdown . % %%%%%   After Lockdown
%%%  Fitted parameters for before lockdown
etaQ = 0.1708; etaA = 0.5840; etaH = 0.5610; 
deltaA = 0.0100; deltaI = 0.0364; deltaQ = 0.0100; deltaH = 0.0100; 
beta0 = 0.7301; nuQ0 = 0.4637; nuH0 = 0.1820; omegaQ0 = 0.0854; omegaH0 = 0.0624; 
% Rc = 2.7462
                                            
%%%% Fitted parameters After lockdown
beta1 = 0.3603;  nuQ1 = 0.4367;  nuH1 = 0.1810;  omegaQ1 = 0.4580;  omegaH1 = 0.6873;                      
% Rc = 1.4953


%%%% United Kingdom sentiment data
ap = (100000).* 0.0012266; bp = (100000).* 0.34568; an = (100000).* (-0.0002375); bn = (100000).* 0.22246;
N0_UK = 67886011;  
E0 = 0.0/N0_UK; A0 = 10.00/N0_UK; I0 = 10.00/N0_UK; Q0 = 0.00/N0_UK; H0 = 0.00/N0_UK; R0 = 0.00/N0_UK;    
S0 = N0_UK/N0_UK- E0-A0-I0-Q0-H0-R0;
x0 = [S0; E0; A0; I0; Q0; H0; R0; 0];    

[t,y]=ode45(@Coronavirus,0:0.1:tf,x0);
S_UK = max(0,y(:,1)); E_UK = max(0,y(:,2)); 
A_UK = max(0,y(:,3)); 
I_UK = max(0,y(:,4));  Q_UK = max(0,y(:,5)); H_UK = max(0,y(:,6)); R_UK = max(0,y(:,7));%  
CI_UK = max(0,y(:,8)).*N0_UK;  



%%%% United States 
%%%% Fitted parameters Before lockdown
beta0 = 0.5800;    etaQ = 0.6500;      etaA = 0.7450;     etaH = 0.7850; 
deltaA = 0.0275;   deltaI = 0.0100;    deltaQ = 0.0100;   deltaH = 0.0100;          
nuQ0 = 0.4700;     nuH0 = 0.1800;      omegaQ0 = 0.4520;  omegaH0 = 0.1300;                                              
% Rc = 4.2760

%%%% Fitted parameters After lockdown
beta1 = 0.1686;    nuQ1 = 0.3500;      nuH1 = 0.1720;      omegaQ1 = 0.6450;    omegaH1 = 0.1189; 
% Rc = 0.9749
                                                          
%%%% United States sentiment data
ap = (100000).*0.00029309; 0; bp = (100000).*0.10708; 0; an = (100000).*5.5321e-06; 0; bn = (100000).* 0.067976; 0;  

N0_US = 331002651; 
E0 = 10.0./N0_US; A0 = 10.00./N0_US; I0 = 10.00./N0_US; Q0 = 0.00./N0_US; H0 = 0.00./N0_US; R0 = 0.00./N0_US;    
S0 = N0_US./N0_US - E0-A0-I0-Q0-H0-R0;
x0 = [S0; E0; A0; I0; Q0; H0; R0; 0];    

[t2,y]=ode45(@Coronavirus,0:0.1:tf,x0);

% S_US = max(0,y(:,1)); E_US = max(0,y(:,2)); 
% A_US = max(0,y(:,3)); 
I_US = max(0,y(:,4));  Q_US = max(0,y(:,5)); H_US = max(0,y(:,6)); %R_US = max(0,y(:,7));  
CI_US = max(0,y(:,8)).*N0_US;  


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% United Kingdom 	

%%%%% Without sentiment

%% initialize parameter space  

N0 = 67886011;   
E0 = 0/N0;   A0 = 0/N0;    I0 = 1/N0;     Q0 = 0/N0;
H0 = 0/N0;   R0 = 0/N0;

N0 = 67988148;
S0  = N0/N0 - (E0 + A0 + I0 + Q0 + H0 + R0);
x0 = [S0; E0; A0; I0; Q0; H0; R0; 0];    

%%%  Fitted parameters for before lockdown
etaQ = 0.1708; etaA = 0.5840; etaH = 0.5610; 
deltaA = 0.0100; deltaI = 0.0364; deltaQ = 0.0100; deltaH = 0.0100; 
beta0 = 0.7301; nuQ0 = 0.4637; nuH0 = 0.1820; omegaQ0 = 0.0854; omegaH0 = 0.0624; 
% Rc = 2.7462
                                            
%%%% Fitted parameters After lockdown
beta1 = 0.3603;  nuQ1 = 0.4367;  nuH1 = 0.1810;  omegaQ1 = 0.4580;  omegaH1 = 0.6873;                      
% Rc = 1.4953


%%%% United Kingdom sentiment data;
ap = 0*(100000).* 0.0012266; bp = 0*(100000).* 0.34568; an = 0*(100000).* (-0.0002375); bn = 0*(100000).* 0.22246;


[t,y]=ode45(@Coronavirus,0:0.1:tf,x0);
% S_UK1 = max(0,y(:,1)); E_UK1 = max(0,y(:,2)); A_UK1 = max(0,y(:,3));  
% R_UK1 = max(0,y(:,7));% CI_UK1 = max(0,y(:,8)).*N0;  
I_UK1 = max(0,y(:,4));  Q_UK1 = max(0,y(:,5)); H_UK1 = max(0,y(:,6)); 



% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% %%%%% With sentiment

% %%%  Fitted parameters for before lockdown
% etaQ = 0.1708; etaA = 0.5840; etaH = 0.5610; 
% deltaA = 0.0100; deltaI = 0.0364; deltaQ = 0.0100; deltaH = 0.0100; 
% beta0 = 0.7301; nuQ0 = 0.4637; nuH0 = 0.1820; omegaQ0 = 0.0854; omegaH0 = 0.0624; 
% % Rc = 2.7462
%                                             
% %%%% Fitted parameters After lockdown
% beta1 = 0.3603;  nuQ1 = 0.4367;  nuH1 = 0.1810;  omegaQ1 = 0.4580;  omegaH1 = 0.6873;                      
% % Rc = 1.4953

%%%% United Kingdom sentiment data*1.5*1.5*0*0
ap = (100000).* 0.0012266; bp = (100000).* 0.34568; an = (100000).* (-0.0002375); bn = (100000).* 0.22246;

[t,y]=ode45(@Coronavirus,0:0.1:tf,x0);
% S_UK2 = max(0,y(:,1)); E_UK2 = max(0,y(:,2)); A_UK2 = max(0,y(:,3)); 
% R_UK2 = max(0,y(:,7));%  CI_UK2 = max(0,y(:,8)).*N0;  
I_UK2 = max(0,y(:,4));  Q_UK2 = max(0,y(:,5)); H_UK2 = max(0,y(:,6)); 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% %%%%%% Positive sentiment only
% %%%  Fitted parameters for before lockdown
% etaQ = 0.1708; etaA = 0.5840; etaH = 0.5610; 
% deltaA = 0.0100; deltaI = 0.0364; deltaQ = 0.0100; deltaH = 0.0100; 
% beta0 = 0.7301; nuQ0 = 0.4637; nuH0 = 0.1820; omegaQ0 = 0.0854; omegaH0 = 0.0624; 
% % Rc = 2.7462
%                                             
% %%%% Fitted parameters After lockdown
% beta1 = 0.3603;  nuQ1 = 0.4367;  nuH1 = 0.1810;  omegaQ1 = 0.4580;  omegaH1 = 0.6873;                      
% % Rc = 1.4953

%%%% United Kingdom sentiment data*1.5*1.5
ap = (100000).* 0.0012266; bp = (100000).* 0.34568; an = 0*(100000).* (-0.0002375); bn = 0*(100000).* 0.22246;


[t2,y]=ode45(@Coronavirus,0:0.1:tf,x0);
% S_UK3 = max(0,y(:,1)); E_UK3 = max(0,y(:,2)); A_UK3 = max(0,y(:,3)); 
% Q_UK3 = max(0,y(:,5)); H_UK3 = max(0,y(:,6)); R_UK3 = max(0,y(:,7));%  CI_Uk3 = max(0,y(:,8));  
I_UK3 = max(0,y(:,4));  


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% %%%%% Negative sentiment only
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*2*2*2*2*2*2
% %%%  Fitted parameters for before lockdown
% etaQ = 0.1708; etaA = 0.5840; etaH = 0.5610; 
% deltaA = 0.0100; deltaI = 0.0364; deltaQ = 0.0100; deltaH = 0.0100; 
% beta0 = 0.7301; nuQ0 = 0.4637; nuH0 = 0.1820; omegaQ0 = 0.0854; omegaH0 = 0.0624; 
% % Rc = 2.7462
%                                             
% %%%% Fitted parameters After lockdown
% beta1 = 0.3603;  nuQ1 = 0.4367;  nuH1 = 0.1810;  omegaQ1 = 0.4580;  omegaH1 = 0.6873;                      
% % Rc = 1.4953

%%%% United Kingdom sentiment data*1.5*1.5
ap = 0*(100000).* 0.0012266; bp = 0*(100000).* 0.34568; an = (100000).* (-0.0002375); bn = (100000).* 0.22246;


[t4,y]=ode45(@Coronavirus,0:0.1:tf,x0);
% S_UK4 = max(0,y(:,1)); E_UK4 = max(0,y(:,2)); A_UK4 = max(0,y(:,3)); 
% Q_UK4 = max(0,y(:,5)); H_UK4 = max(0,y(:,6)); R_UK4 = max(0,y(:,7));%  CI_Uk4 = max(0,y(:,8));  
I_UK4 = max(0,y(:,4));  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Omega * 2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Fitted parameters for before lockdown
etaQ = 0.1708; etaA = 0.5840; etaH = 0.5610; 
deltaA = 0.0100; deltaI = 0.0364; deltaQ = 0.0100; deltaH = 0.0100; 
beta0 = 0.7301; nuQ0 = 0.4637; nuH0 = 0.1820; omegaQ0 = 0.0854*2; omegaH0 = 0.0624*2; 
% Rc = 2.7462
                                            
%%%% Fitted parameters After lockdown
beta1 = 0.3603;  nuQ1 = 0.4367;  nuH1 = 0.1810;  omegaQ1 = 0.4580*2;  omegaH1 = 0.6873*2;                      
% Rc = 1.4953

%%%% United Kingdom sentiment data 
ap = (100000).* 0.0012266; bp = (100000).* 0.34568; an = (100000).* (-0.0002375); bn = (100000).* 0.22246;

[t5,y]=ode45(@Coronavirus,0:0.1:tf,x0);
% S_UK5 = max(0,y(:,1)); E_UK5 = max(0,y(:,2)); A_UK5 = max(0,y(:,3)); 
% R_UK5 = max(0,y(:,7));%  CI_Uk5 = max(0,y(:,8));  
I_UK5 = max(0,y(:,4)); Q_UK5 = max(0,y(:,5)); H_UK5 = max(0,y(:,6)); 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% %%%%% Nu * 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Fitted parameters for before lockdown
etaQ = 0.1708; etaA = 0.5840; etaH = 0.5610; 
deltaA = 0.0100; deltaI = 0.0364; deltaQ = 0.0100; deltaH = 0.0100; 
beta0 = 0.7301; nuQ0 = 0.4637*2.3; nuH0 = 0.1820*2.3; omegaQ0 = 0.0854; omegaH0 = 0.0624; 
% Rc = 2.7462
                                            
%%%% Fitted parameters After lockdown
beta1 = 0.3603;  nuQ1 = 0.4367*2.3;  nuH1 = 0.1810*2.3;  omegaQ1 = 0.4580;  omegaH1 = 0.6873;                      
% Rc = 1.4953


%%%% United Kingdom sentiment data 
ap = (100000).* 0.0012266; bp = (100000).* 0.34568; an = (100000).* (-0.0002375); bn = (100000).* 0.22246;

[t6,y]=ode45(@Coronavirus,0:0.1:tf,x0);
% S_UK6 = max(0,y(:,1)); E_UK6 = max(0,y(:,2)); A_UK6 = max(0,y(:,3)); 
% R_UK6 = max(0,y(:,7));%  CI_Uk6 = max(0,y(:,8));  
I_UK6 = max(0,y(:,4));  Q_UK6 = max(0,y(:,5)); H_UK6 = max(0,y(:,6)); 




% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


FS = 13;  % font size for graphs

set(0,'DefaultAxesFontSize',25)  

figure(11)
box on;
hold on; 
plot(t, CI_AU, 'LineWidth', 2, 'Color', [0 0 1]);  % blue 
plot(t, CI_BR, '--', 'LineWidth', 2, 'Color', [0 0.5 0]); % green
plot(t, CI_IY, 'LineWidth', 2, 'Color', [1 0 0]); % red
plot(t, CI_SA, '--', 'LineWidth', 2, 'Color', [1 0 0]); % red
plot(t, CI_UK, '--', 'LineWidth', 2, 'Color', [0 0 1]); % blue 
plot(t, CI_US, 'LineWidth', 2, 'Color', [0 0.5 0]); % green
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 4.5, 3]);
set(gca, 'FontSize', FS)
ax = gca;
ax.TickLabelInterpreter = 'latex';
xlabel('Days since first case', 'Interpreter', 'latex')
ylabel('Cumulative cases', 'Interpreter', 'latex')  
legend('Australia','Brazil','Italy','South Africa','United Kingdom','United States', ...
    'Interpreter', 'latex');  
legend boxoff



figure(22)
box on;
hold on;
plot(t,I_UK1,'r','LineWidth',2);hold on  
plot(t,I_UK2, 'Color', [0 0.5 0],'LineWidth',2);hold on  
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 5, 3.7]);
set(gca, 'FontSize', FS)
ax = gca;
ax.TickLabelInterpreter = 'latex';
ylabel('Symptomatic infectious sub-population ', 'Interpreter', 'latex')
xlabel('Days since first reported case(s)', 'Interpreter', 'latex');  %axis tight   
legend('Without sentiment','With sentiment')
legend boxoff
 
printTOeps = true;  % if true, the figures will be printed to EPS files

figure(33)
box on;
hold on;
plot(t, I_UK1, 'LineWidth', 2, 'Color', [1 0 0]);
plot(t, I_UK3, '-', 'LineWidth', 2, 'Color', [0 0.5 0]);
plot(t, I_UK4, '-', 'LineWidth', 2, 'Color', [0 0 0]);
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 5, 3.7]);
set(gca, 'FontSize', FS)
ax = gca;
ax.TickLabelInterpreter = 'latex';
xlabel('Days since first case', 'Interpreter', 'latex')
ylabel('Symptomatic infectious sub-population', 'Interpreter', 'latex')
legend('Without sentiment','With +ve sentiment','With -ve sentiment')
legend boxoff

figure(44)
box on;
hold on;
plot(t, I_UK2, 'LineWidth', 2, 'Color', [1 0 0]);
plot(t, Q_UK2, 'LineWidth', 2, 'Color', [0 0 1]);
plot(t, H_UK2, 'LineWidth', 2, 'Color', [0 0.5 0]);
plot(t, I_UK5, '--', 'LineWidth', 2, 'Color', [1 0 0]);
plot(t, Q_UK5, '--', 'LineWidth', 2, 'Color', [0 0 1]);
plot(t, H_UK5, '--', 'LineWidth', 2, 'Color', [0 0.5 0]);
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 4, 3]);
set(gca, 'FontSize', FS)
ax = gca;
ax.TickLabelInterpreter = 'latex';
xlabel('Days since first case', 'Interpreter', 'latex')
ylabel('Infected population', 'Interpreter', 'latex')
legend('$I(t)$', '$Q(t)$', '$H(t)$', '$I(t)$', '$Q(t)$', '$H(t)$', ...
    'Interpreter', 'latex');
legend boxoff


figure(55)
box on;
hold on;
plot(t, I_UK2, 'LineWidth', 2, 'Color', [1 0 0]);
plot(t, Q_UK2, 'LineWidth', 2, 'Color', [0 0 1]);
plot(t, H_UK2, 'LineWidth', 2, 'Color', [0 0.5 0]);
plot(t, I_UK6, '--', 'LineWidth', 2, 'Color', [1 0 0]);
plot(t, Q_UK6, '--', 'LineWidth', 2, 'Color', [0 0 1]);
plot(t, H_UK6, '--', 'LineWidth', 2, 'Color', [0 0.5 0]);
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 4, 3]);
set(gca, 'FontSize', FS)
ax = gca;
ax.TickLabelInterpreter = 'latex';
xlabel('Days since first case', 'Interpreter', 'latex')
ylabel('Infected population', 'Interpreter', 'latex')
legend('$I(t)$', '$Q(t)$', '$H(t)$', '$I(t)$', '$Q(t)$', '$H(t)$', ...
    'Interpreter', 'latex');
legend boxoff

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    
function dydt = Coronavirus(t,y)
   
global  beta0 beta1 etaA etaQ etaH sigma gammaI gammaA gammaQ gammaH    
global  q deltaQ deltaH deltaI deltaA nuQ0 nuQ1
global  nuH0 nuH1 omegaQ1 omegaQ0 omegaH1 omegaH0 ap bp an bn

S = max(0,y(1)); E = max(0,y(2)); A = max(0,y(3)); I = max(0,y(4));
Q = max(0,y(5)); H = max(0,y(6)); R = max(0,y(7));   CI = max(0,y(8)); 
    
N = S+E+A+I+Q+H+R;   

yp = ap*t + bp;
yn = an*t + bn;

m= (0.00001* (yp-yn));  % (1/100000).* 

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
