%%%%%% Parameter Estimation for ODE Model %%%%%%%%%%%%
%
function COVID19FIT_UK_Before_with_Sentiments
clear all
close all
clc
%%%%%%%% Load data (from excel spreadsheet) %%%%%%%%%
data = xlsread('UK');
tdata = data(1:53,1);%124
Cumulativecasedata = data(1:53,2);
%   Dailydeathdata = data(44:167,3);
 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initialize states

parameter(1) = 0.975; %%%%%% beta_0: Needs fitting
parameter(2) = 0.2785; %%%%%% etaQ: Needs fitting
parameter(3) = 0.5469; %%%%%%%%% etaA: Needs fitting
parameter(4) = 0.09575; %%%%%%%%% deltaA: Needs fitting
parameter(5) = 0.09649; %%%%%%%%% deltaI: Needs fitting
parameter(6) = 0.04576; %%%%%% deltaQ: Needs fitting
parameter(7) = 0.09706; %%%%%%%%% deltaH: Needs fitting
parameter(8) = 0.3572; %%%%%%%%% etaH: Needs fitting
parameter(9) = 0.4854; %%%%%%%%% nuQ0: Needs fitting
parameter(10) = 0.8003; %%%%%%%%% nuH0: Needs fitting
parameter(11) = 0.1419; %%%%%%%%%  omegQ0: Needs fitting
parameter(12) = 0.4218; %%%%%%%%% omegH0: Needs fitting
   

N0 = 1;
E0 = 0/N0;
A0 = 0/N0;
I0 = 1/N0;
Q0 = 0/N0;
H0 = 0/N0;
R0 = 0/N0;
D0 = 0/N0;

x0(2) = E0;
x0(3) = A0;
x0(4) = I0;
x0(5) = Q0;
x0(6) = H0;
x0(7) = R0;
x0(8) = D0; 

N0 = 67988148;
x0(1) = N0 - (E0 + A0 + I0 + Q0 + H0 + R0);

%% initialize parameter space (a guess is fine)

%
%% Fixed parameters

r =   0.6;  
sigma =  0.7; 
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
% media = 1.6275e-06;


%% 
%        beta    etaQ    etaH    omegaQ  omegaH  nuQ      nuH      gammaA   gammaI  gammaQ   gammaH = ')
%%% R0 = 1.8384
% LB = [0.4975  0.3408  0.1362  0.4530  0.1976  0.4603   0.1301   0.6597   0.0273  0.0830   0.0410];
% UB = [1.0     0.3509  0.1363  0.4531  0.1977  0.4605   0.1305   0.8798   0.0775  0.1831   0.0422];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% beta0     etaQ      etaA      deltaA    deltaI    deltaQ    deltaH    etaH      nuQ0      nuH0      omegQ0    omegH0 
% 0.7301    0.1708    0.5840    0.0100    0.0364    0.0100    0.0100    0.5610    0.4637    0.1820    0.0854    0.0624
% Rc = 2.7462

%      beta0    etaQ     etaA   deltaA  deltaI  deltaQ  deltaH  etaH   nuQ0      nuH0   omegQ0  omegH0
 LB = [0.7301   0.1708   0.56   0.01    0.01    0.01    0.01    0.01   0.4637    0.128  0.0452  0.0295];
 UB = [0.8301   0.2908   0.584  0.0488  0.07    0.034   0.5107  0.561  0.6437    0.182  0.0854  0.0624];
%
%
Estimated_parameters = fmincon(@SumOfSquaresOfErrors,parameter,[],[],[],[],LB,UB);
%
disp('    beta0     etaQ      etaA      deltaA    deltaI    deltaQ    deltaH    etaH      nuQ0      nuH0      omegQ0    omegH0 ')
disp(Estimated_parameters);  
%
beta_0 = Estimated_parameters(1);
etaQ = Estimated_parameters(2); 
etaA = Estimated_parameters(3);
deltaA = Estimated_parameters(4);
deltaI = Estimated_parameters(5);
deltaQ = Estimated_parameters(6);
deltaH = Estimated_parameters(7);
etaH = Estimated_parameters(8);
nuQ0 = Estimated_parameters(9);
nuH0 = Estimated_parameters(10);
omegQ0 = Estimated_parameters(11);
omegH0 = Estimated_parameters(12);
    
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
function SoSD = SumOfSquaresOfErrors(parameter)
etaH = parameter(1);
etaQ = parameter(2); 
etaA = parameter(3);
deltaA = parameter(4);
deltaI = parameter(5);
deltaQ = parameter(6);
deltaH = parameter(7);
beta_0 = parameter(8);
nuQ0 = parameter(9);
nuH0 = parameter(10);
omegQ0 = parameter(11);
omegH0 = parameter(12);
  
           
function dy = COVID19Model(t,y)
    S  = y(1);
    E  = y(2);
    A  = y(3);
    I  = y(4);
    Q = y(5);
    H = y(6);
    R  = y(7);
    C  = y(8);
Nh = S+E+A+I+Q+H+R;

nuQ=nuQ0.*exp(-media.*C) ; 
nuH=nuH0.*exp(-media.*C) ; 
omegQ=omegQ0.*exp(-media.*C)  ;
omegH=omegH0.*exp(-media.*C);    
    
%               
k1=(gammaA+deltaA);  k2=(gammaI+omegQ+omegH+deltaI);  k3=(nuQ + gammaQ+deltaQ);
k4=(nuH + gammaH+deltaH); qq=(1-r);  

Rc = (beta_0.*exp(-media.*C)).*qq.*(k3*etaH.*omegH + k4.*etaQ.*omegQ + k3.*k4)./(k2.*k3.*k4 - k3.*nuH.*omegH - k4.*nuQ.*omegQ)...
    + (beta_0.*exp(-media.*C)).*r*etaA./k1             
               
                
dy = zeros(8,1);
    
dy(1) = -(beta_0.*exp(-media.*C)).*(I+etaA*A+etaQ*Q+etaH*H)*S./Nh; 
dy(2) = (beta_0.*exp(-media.*C)).*(I+etaA*A+etaQ*Q+etaH*H)*S./Nh-sigma*E; 
dy(3) = r*sigma*E-(gammaA+deltaA)*A;
dy(4) = (1-r)*sigma*E+nuQ*Q+nuH*H-(gammaI+omegQ+omegH+deltaI)*I;
dy(5) = omegQ*I-(gammaQ+nuQ+deltaQ)*Q;
dy(6) = omegH*I-(gammaH+nuH+deltaH)*H;
dy(7) = gammaI*I+gammaA*A+gammaQ*Q+gammaH*H +deltaI*I+deltaA*A+deltaQ*Q+deltaH*H;
dy(8) = (1-r)*sigma*E;
        
end

tspan = 1:1:53; 
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
%
SoSD = sum((Pred_Inc - Cumulativecasedata).^2);

fs = 13;
figure(102) %
plot(tdata,Cumulativecasedata,'.r','MarkerSize',10,'Color',[1 0 0]); % red
hold on;
plot(tdata,Y(:,8),'-','LineWidth',2, 'Color',[.0 .0 1.0]); % blue
hold off
legend('UK data','Model prediction','location','northwest')
set(gcf, 'Units', 'Inches', 'Position', [0, 0, 4, 3]);
set(gca, 'FontSize', fs)
ax = gca;
ax.TickLabelInterpreter = 'latex';
xlabel('Days since first case', 'Interpreter', 'latex') %lock down
ylabel('Cumulative cases', 'Interpreter', 'latex')


end

end

