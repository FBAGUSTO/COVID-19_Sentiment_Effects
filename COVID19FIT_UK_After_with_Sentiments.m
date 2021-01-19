%%%%%% Parameter Estimation for ODE Model %%%%%%%%%%%%
%
function COVID19FIT_UK_After_with_Sentiments
clear all
close all
clc
%%%%%%%% Load data (from excel spreadsheet) %%%%%%%%%
data = xlsread('UK');
tdata = data(54:140,1);%130
Cumulativecasedata = data(54:140,2);
%   Dailydeathdata = data(44:167,3);
 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initialize states

parameter(1) = 0.975; %%%%%% beta_1: Needs fitting
parameter(2) = 0.785; %%%%%% nuQ1: Needs fitting
parameter(3) = 0.6469; %%%%%%%%% nuH1: Needs fitting
parameter(4) = 0.4575; %%%%%%%%% omegQ1: Needs fitting
parameter(5) = 0.9649; %%%%%%%%% omegH1: Needs fitting

E0 = 8000;
A0 = 10000;%
I0 = 15000; 
Q0 = 3000;
H0 = 5000;
R0 = 8500; 0;
D0 = 8081;


x0(2) = E0;
x0(3) = A0;
x0(4) = I0;
x0(5) = Q0;
x0(6) = H0;
x0(7) = R0;
x0(8) = D0; 

N0 = 67988148;
%
x0(1) =  N0 - (E0 + A0 + I0 + Q0 + H0 + R0);
%
%% initialize parameter space (a guess is fine)

%
%% Fixed parameters
r = 0.6; 
sigma = 0.7;
gammaA = 0.13978;
gammaI = 1/10;
gammaQ = 1/10;
gammaH = 1/8;


%%%% United Kingdom sentiment data
ap = 0.0012266; bp = 0.34568; an = -0.0002375; bn = 0.22246;

t=tdata;  
yp = ap.*t + bp;
yn = an.*t + bn;
mm=((1/100000).*(yp-yn)); 

media = mean(mm);  
% media =  2.6524e-06;

etaQ = 0.1708; etaA = 0.5840; etaH = 0.5610; 
deltaA = 0.0100; deltaI = 0.0364; deltaQ = 0.0100; deltaH = 0.0100; 
% beta0 = 0.7301; nuQ0 = 0.4637; nuH0 = 0.1820; omegQ0 = 0.0854; omegH0 = 0.0624; 
% Rc = 2.7462

%% 
%%%  Fitted parameters for before lockdown
% beta0     etaQ      etaA      deltaA    deltaI    deltaQ    deltaH    etaH      nuQ0      nuH0      omegQ0    omegH0 
% 0.7301    0.1708    0.5840    0.0100    0.0364    0.0100    0.0100    0.5610    0.4637    0.1820    0.0854    0.0624
% Rc = 2.7462

%%%% Fitted parameters After lockdown
% beta1    nuQ1      nuH1      omegQ1    omegH1 
% 0.3603    0.4367    0.1810    0.4580    0.6873
% Rc = 1.4953

%     beta1      nuQ1    nuH1      omegQ1  omegH1
LB = [0.31175   0.420    0.1240    0.4580  0.6873];
UB = [0.632     0.4367  0.1810    0.5390  0.6932];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
Estimated_parameters = fmincon(@SumOfSquaresOfErrors,parameter,[],[],[],[],LB,UB);
%

disp('    beta1    nuQ1      nuH1      omegQ1    omegH1 ')
disp(Estimated_parameters);  
%

 beta_1 = Estimated_parameters(1);
 nuQ1 = Estimated_parameters(2) ;
 nuH1 = Estimated_parameters(3);
 omegQ1 = Estimated_parameters(4);
 omegH1 = Estimated_parameters(5) ;
      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
function SoSD = SumOfSquaresOfErrors(parameter)

 beta_1 = parameter(1);
 nuQ1 = parameter(2); 
 nuH1 = parameter(3);
 omegQ1 = parameter(4);
 omegH1 = parameter(5); 

% 
function dy = COVID19Model(t,y)
    S = y(1);
    E = y(2);
    A = y(3);
    I = y(4);
    Q = y(5);
    H = y(6);
    R = y(7);
    C = y(8);
    Nh = S+E+A+I+Q+H+R;

nuQ=nuQ1.*exp(-media.*C) ; 
nuH=nuH1.*exp(-media.*C) ; 
omegQ=omegQ1.*exp(-media.*C)  ;
omegH=omegH1.*exp(-media.*C);  
    
%               
k1 = (gammaA+deltaA);  k2=(gammaI+omegQ1+omegH1+deltaI);  k3=(nuQ1 + gammaQ+deltaQ);
k4 = (nuH1 + gammaH+deltaH); qq=(1-r);  

Rc = beta_1.*qq.*(k3*etaH.*omegH1 + k4.*etaQ.*omegQ1 + k3.*k4)./(k2.*k3.*k4 - k3.*nuH1.*omegH1 - k4.*nuQ1.*omegQ1)...
    + beta_1.*r*etaA./k1              
               
dy = zeros(8,1);
    
dy(1) = -(beta_1.*exp(-media.*C)).*(I+etaA*A+etaQ*Q+etaH*H)*S./Nh; 
dy(2) = (beta_1.*exp(-media.*C)).*(I+etaA*A+etaQ*Q+etaH*H)*S./Nh-sigma*E; 
dy(3) = r*sigma*E-(gammaA+deltaA)*A;
dy(4) = (1-r)*sigma*E+nuQ*Q+nuH*H-(gammaI+omegQ+omegH+deltaI)*I;
dy(5) = omegQ*I-(gammaQ+nuQ+deltaQ)*Q;
dy(6) = omegH*I-(gammaH+nuH+deltaH)*H;
dy(7) = gammaI*I+gammaA*A+gammaQ*Q+gammaH*H +deltaI*I+deltaA*A+deltaQ*Q+deltaH*H;
dy(8) = (1-r)*sigma*E;
        
end

tspan = tdata; 
[time,Y] = ode45(@COVID19Model,tspan,x0);
%
    S = Y(:,1);
    E = Y(:,2);
    A = Y(:,3);
    I = Y(:,4);
    Q = Y(:,5);
    H = Y(:,6);
    R = Y(:,7);
    C = Y(:,8);
CumulativeCases = Y(:,8);

Pred_Inc = interp1(time,CumulativeCases,tdata);

SoSD = sum((Pred_Inc - Cumulativecasedata).^2);


fs = 13;
figure(102) %
plot(tdata,Cumulativecasedata,'.r','MarkerSize',10,'Color',[1 0. 0]); % red
hold on;
plot(tdata,Y(:,8),'-','LineWidth',2, 'Color',[.0 .0 1.0]);  %  blue
hold off
legend('UK data','Model prediction','location','northwest')
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 4, 3]);
set(gca, 'FontSize', fs)
ax = gca;
ax.TickLabelInterpreter = 'latex';
xlabel('Days since lock down', 'Interpreter', 'latex')
ylabel('Cumulative cases', 'Interpreter', 'latex')
 


end

end


