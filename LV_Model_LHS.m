
clear all;
close all;

%% PRCC

%% Sample size N
 
nsample = 1000;

%% LHS MATRIX  %%

%LV_Parameter_settings_LHS;

% Parameter Labels 
PRCC_var = {'\gamma_A','\gamma_I','\gamma_Q','\gamma_H','\delta_A','\delta_I',...
         '\delta_Q','\delta_H','\sigma','q','\beta','\eta_A','\eta_Q',...
         '\eta_H','\omega_Q','\omega_H','\nu_Q','\nu_H'};
         

%xmin=0;
%xmax=xmin;

%% Each parameter lies within 25% of the baseline parameter
 

% gammaA_LHS = LHS_Call( 0.0357, 0.0714, 0.1071, 0.02, nsample, 'unif'); %change bounds to plus or minus 50% of baseline values
% gammaI_LHS = LHS_Call( 0.0357, 0.0714, 0.1071, 0.02, nsample, 'unif');
% gammaQ_LHS = LHS_Call( 0.0357, 0.0714, 0.1071, 0.02, nsample, 'unif');
% gammaH_LHS = LHS_Call( 0.0357, 0.0714, 0.1071, 0.02, nsample, 'unif');
% deltaA_LHS = LHS_Call( 0.144, 0.288, 0.432, 0.08, nsample, 'unif');
% deltaI_LHS = LHS_Call( 0.144, 0.288, 0.432, 0.08, nsample, 'unif');
% deltaQ_LHS = LHS_Call( 0.144, 0.288, 0.432, 0.08, nsample, 'unif');
% deltaH_LHS = LHS_Call( 0.144, 0.288, 0.432, 0.08, nsample, 'unif');
% sigma_LHS  = LHS_Call( 0.098, 0.1, 0.294, 0.06, nsample, 'unif');
% r_LHS      = LHS_Call( 0.25, 0.1, 0.75, 0.14, nsample, 'unif');
% betb_LHS   = LHS_Call( 0.834, 1.668, 2.502, 0.48, nsample, 'unif');
% etaA_LHS   = LHS_Call( 0.0325, 0.065, 0.0975, 0.019, nsample, 'unif');
% etaQ_LHS   = LHS_Call( 0.046, 0.092, 0.138, 0.027, nsample, 'unif');
% etaH_LHS   = LHS_Call( 0.025, 0.05, 0.075, 0.014, nsample, 'unif');
% omegaQ_LHS = LHS_Call(0.0815, 0.163, 0.2445, 0.047, nsample, 'unif');
% omegaH_LHS = LHS_Call(0.063, 0.126, 0.189, 0.036, nsample, 'unif');
% nuQ_LHS    = LHS_Call( 0.0855, 0.171,  0.2565, 0.049, nsample, 'unif');
% nuH_LHS    = LHS_Call( 0.1105, 0.221, 0.3315, 0.064, nsample, 'unif');

r_base = 0.6;
sigma_base = 0.7;
gammaA_base = 0.13978;
gammaI_base = 1/10;
gammaQ_base = 1/10;
gammaH_base = 1/8;

etaQ_base = 0.1908;    etaA_base = 0.2800;    etaH_base = 0.5600;    
deltaA_base = 0.0488;  deltaI_base = 0.0100;  deltaQ_base = 0.0100;  deltaH_base = 0.5071;
beta_base = 0.7301;  nuQ_base = 5*0.4670;    nuH_base = 5*0.1800;    omegaQ_base = 5*0.0835;  omegaH_base = 5*0.0100;

runs = nsample;

gammaA_LHS = LHS_Call((1-0.3)*gammaA_base, gammaA_base, (1+0.3)*gammaA_base, 0 ,runs,'unif');  
gammaI_LHS = LHS_Call((1-0.3)*gammaI_base, gammaI_base, (1+0.3)*gammaI_base, 0 ,runs,'unif'); 
gammaQ_LHS = LHS_Call((1-0.3)*gammaQ_base, gammaQ_base, (1+0.3)*gammaQ_base, 0 ,runs,'unif');  
gammaH_LHS = LHS_Call((1-0.3)*gammaH_base, gammaH_base, (1+0.3)*gammaH_base, 0 ,runs,'unif'); 
deltaI_LHS = LHS_Call((1-0.3)*deltaI_base, deltaI_base, (1+0.3)*deltaI_base, 0 ,runs,'unif'); 
deltaA_LHS = LHS_Call((1-0.3)*deltaA_base, deltaA_base, (1+0.3)*deltaA_base, 0 ,runs,'unif');  
deltaQ_LHS = LHS_Call((1-0.3)*deltaQ_base, deltaQ_base, (1+0.3)*deltaQ_base, 0 ,runs,'unif');  
deltaH_LHS = LHS_Call((1-0.3)*deltaH_base, deltaH_base, (1+0.3)*deltaH_base, 0 ,runs,'unif');   
sigma_LHS = LHS_Call((1-0.3)*sigma_base, sigma_base, (1+0.3)*sigma_base, 0 ,runs,'unif');  
r_LHS = LHS_Call((1-0.3)*r_base, r_base, (1+0.3)*r_base, 0 ,runs,'unif');  
beta_LHS = LHS_Call((1-0.3)*beta_base, beta_base, (1+0.3)*beta_base, 0 ,runs,'unif');  
etaA_LHS = LHS_Call((1-0.3)*etaA_base, etaA_base, (1+0.3)*etaA_base, 0 ,runs,'unif');  
etaQ_LHS = LHS_Call((1-0.3)*etaQ_base, etaQ_base, (1+0.3)*etaQ_base, 0 ,runs,'unif');  
etaH_LHS = LHS_Call((1-0.3)*etaH_base, etaH_base, (1+0.3)*etaH_base, 0 ,runs,'unif');  
omegaQ_LHS = LHS_Call((1-0.3)*omegaQ_base, omegaQ_base, (1+0.3)*omegaQ_base, 0 ,runs,'unif');  
omegaH_LHS = LHS_Call((1-0.3)*omegaH_base, omegaH_base, (1+0.3)*omegaH_base, 0 ,runs,'unif');  
nuQ_LHS = LHS_Call((1-0.3)*nuQ_base, nuQ_base, (1+0.3)*nuQ_base, 0 ,runs,'unif');  
nuH_LHS = LHS_Call((1-0.3)*nuH_base, nuH_base, (1+0.3)*nuH_base, 0 ,runs,'unif'); 



 %% LHS MATRIX and PARAMETER LABELS
 
 LHSmatrix  = [gammaA_LHS gammaI_LHS gammaQ_LHS gammaH_LHS deltaA_LHS ...
                deltaI_LHS deltaQ_LHS deltaH_LHS sigma_LHS r_LHS beta_LHS...
                etaA_LHS etaQ_LHS etaH_LHS omegaQ_LHS omegaH_LHS nuQ_LHS nuH_LHS];
  
for x=1:nsample 
    x
    LHSmatrix(x,:)
        
    y = [];
    for i = 1:size(LHSmatrix,1)
        K1(i) = LHSmatrix(i,2)+LHSmatrix(i,15)+LHSmatrix(i,16)+LHSmatrix(i,6);
        K2(i) = LHSmatrix(i,1)+LHSmatrix(i,5);
        K3(i) = LHSmatrix(i,17)+LHSmatrix(i,3)+LHSmatrix(i,7);
        K4(i) = LHSmatrix(i,18)+LHSmatrix(i,4)+LHSmatrix(i,8);
        
        y(i) = (1- LHSmatrix(i,10))* LHSmatrix(i,11)*K3(i)*K4(i)/(K1(i)*K3(i)*K4(i)-LHSmatrix(i,15)*LHSmatrix(i,17)*K4(i)-LHSmatrix(i,16)*LHSmatrix(i,18)*K3(i))...
              +(1- LHSmatrix(i,10))* LHSmatrix(i,11)*LHSmatrix(i,13)*LHSmatrix(i,15)*K4(i)/(K1(i)*K3(i)*K4(i)-LHSmatrix(i,15)*LHSmatrix(i,17)*K4(i)-LHSmatrix(i,16)*LHSmatrix(i,18)*K3(i))...
              +(1- LHSmatrix(i,10))* LHSmatrix(i,11)*LHSmatrix(i,14)*LHSmatrix(i,16)*K3(i)/(K1(i)*K3(i)*K4(i)-LHSmatrix(i,15)*LHSmatrix(i,17)*K4(i)-LHSmatrix(i,16)*LHSmatrix(i,18)*K3(i))...
              +(LHSmatrix(i,10)*LHSmatrix(i,11)*LHSmatrix(i,12))/K2(i);
    end
    
    R0 = y;

end
 
%% Save the workspace
 
% save LV_Model_LHS.mat;

mean(R0)
%% CALCULATE PRCC
 
alpha = 1e-3; 
  
[prcc sign sign_label] = PRCC(LHSmatrix,R0,1:length(nsample),PRCC_var,alpha);
%[prcc sign sign_label] = PRCC(LHSmatrix,R0,1:length(time_points),PRCC_var,alpha);
