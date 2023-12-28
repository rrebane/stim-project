%********************************************************
%Run and plot IRFs in Fig.1. for the financial accelerator case in  Gertler, M. and Karadi, P. ``A Model of Unconvetional Monetary Policy''
%In: Journal of Monetary Economics (2011)
 
%********************************************************

clear all;
clc;
close all;

%adjust path to folder where replication file is stored
cd([cd '/NK_GK11_rep']);

%Monetary Policy parameters
rho_i_values = [0.0, 0.95, 0.8, 0.8]; % Interest rate smoothing coefficient
kappa_pi_values = [1.5, 1.5, 1.65, 1.77]; %Inflation coefficient
kappa_y_values = [-0.5/4, -0.5/4, -0.68/4, -0.32/4]; %Output gap coefficient

mkdir('../data');

for i=0:length(rho_i_values)
    if i == 0
        fprintf('[%d] Running iteration %d with default parameters\n', i, i);
    else
        fprintf('[%d] Running iteration %d with parameters rho_i=%.2f, kappa_pi=%.2f, kappa_y=%.2f\n', ...
            i, i, rho_i_values(i), kappa_pi_values(i), kappa_y_values(i));
    end

    if i == 0
        % Use default parameters for first iteration
        dynare NK_GK11_rep noclearall;
    else
        set_param_value('rho_i',rho_i_values(i));
        set_param_value('kappa_pi',kappa_pi_values(i));
        set_param_value('kappa_y',kappa_y_values(i));
        info = stoch_simul(var_list_);
        save('NK_GK11_rep_results.mat', 'oo_', 'M_', 'options_');
    end

    % Save IRFs for e_disutil
    savefile = sprintf('../data/multiple_%d.mat', i);
    fprintf('[%d] Saving file: %s\n', i, savefile);
    save(savefile, 'a_e_disutil', 'C_e_disutil', 'D_e_disutil', 'delta_e_disutil', 'eta_e_disutil', 'F_e_disutil', 'g_e_disutil', 'G_e_disutil', 'i_e_disutil', 'I_e_disutil', 'In_e_disutil', 'infl_e_disutil', 'inflstar_e_disutil', 'K_e_disutil', 'Keff_e_disutil', 'ksi_e_disutil', 'L_e_disutil', 'Lambda_e_disutil', 'N_e_disutil', 'Ne_e_disutil', 'Nn_e_disutil', 'nu_e_disutil', 'phi_e_disutil', 'Pm_e_disutil', 'prem_e_disutil', 'Q_e_disutil', 'R_e_disutil', 'rho_disutil', 'Rk_e_disutil', 'sigma_disutil', 'U_e_disutil', 'varrho_e_disutil', 'VMPK_e_disutil', 'w_e_disutil', 'Welf_e_disutil', 'x_e_disutil', 'X_e_disutil', 'Y_e_disutil', 'Ym_e_disutil', 'z_e_disutil', 'Z_e_disutil', 'disutil_e_a', 'disutil_e_g', 'disutil_e_i', 'disutil_e_ksi', 'disutil_e_Ne', 'disutil_e_disutil');
end

t=1:1:40;

m=5;
n=3;

subplot(m,n,1);
load ../data/multiple_0.mat;
plot(t,disutil_e_disutil*100,'k','LineWidth',1.0);
ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex');
title('Disutility of work', 'Interpreter', 'LaTex');

subplot(m,n,2);
hold on;
load ../data/multiple_0.mat;
plot(t,4*R_e_disutil*100,'-k','LineWidth',1.0);
load ../data/multiple_1.mat;
plot(t,4*R_e_disutil*100,'--b','LineWidth',1.0);
load ../data/multiple_2.mat;
plot(t,4*R_e_disutil*100,'-.r','LineWidth',1.0);
hold off;
ylabel({'Annualized', '$\%\Delta$ from ss'}, 'Interpreter','LaTex'); 
title('R', 'Interpreter', 'LaTex');

subplot(m,n,3);
plot(t,4*prem_e_disutil*100,'k','LineWidth',1.0);
hold on;
load ../data/multiple_0.mat;
plot(t,4*prem_e_disutil*100,'-k','LineWidth',1.0);
load ../data/multiple_1.mat;
plot(t,4*prem_e_disutil*100,'--b','LineWidth',1.0);
load ../data/multiple_2.mat;
plot(t,4*prem_e_disutil*100,'-.r','LineWidth',1.0);
hold off;
ylabel({'Annualized', '$\%\Delta$ from ss'}, 'Interpreter','LaTex'); 
title('$E\left[R_{k}\right]-R$', 'Interpreter','LaTex');

subplot(m,n,4);
hold on;
load ../data/multiple_0.mat;
plot(t,Y_e_disutil*100,'-k','LineWidth',1.0);
load ../data/multiple_1.mat;
plot(t,Y_e_disutil*100,'--b','LineWidth',1.0);
load ../data/multiple_2.mat;
plot(t,Y_e_disutil*100,'-.r','LineWidth',1.0);
hold off;
ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex');
title('Y', 'Interpreter', 'LaTex');

subplot(m,n,5);
hold on;
load ../data/multiple_0.mat;
plot(t,C_e_disutil*100,'-k','LineWidth',1.0);
load ../data/multiple_1.mat;
plot(t,C_e_disutil*100,'--b','LineWidth',1.0);
load ../data/multiple_2.mat;
plot(t,C_e_disutil*100,'-.r','LineWidth',1.0);
hold off;
ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex');
title('C', 'Interpreter', 'LaTex');

subplot(m,n,6);
hold on;
load ../data/multiple_0.mat;
plot(t,I_e_disutil*100,'-k','LineWidth',1.0);
load ../data/multiple_1.mat;
plot(t,I_e_disutil*100,'--b','LineWidth',1.0);
load ../data/multiple_2.mat;
plot(t,I_e_disutil*100,'-.r','LineWidth',1.0);
hold off;
ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex');
title('I', 'Interpreter', 'LaTex');

subplot(m,n,7);
hold on;
load ../data/multiple_0.mat;
plot(t,K_e_disutil*100,'-k','LineWidth',1.0);
load ../data/multiple_1.mat;
plot(t,K_e_disutil*100,'--b','LineWidth',1.0);
load ../data/multiple_2.mat;
plot(t,K_e_disutil*100,'-.r','LineWidth',1.0);
hold off;
ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex');
title('K', 'Interpreter', 'LaTex');

subplot(m,n,8);
hold on;
load ../data/multiple_0.mat;
plot(t,L_e_disutil*100,'-k','LineWidth',1.0);
load ../data/multiple_1.mat;
plot(t,L_e_disutil*100,'--b','LineWidth',1.0);
load ../data/multiple_2.mat;
plot(t,L_e_disutil*100,'-.r','LineWidth',1.0);
hold off;
ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex');
title('L', 'Interpreter', 'LaTex');

subplot(m,n,9);
hold on;
load ../data/multiple_0.mat;
plot(t,Q_e_disutil*100,'-k','LineWidth',1.0);
load ../data/multiple_1.mat;
plot(t,Q_e_disutil*100,'--b','LineWidth',1.0);
load ../data/multiple_2.mat;
plot(t,Q_e_disutil*100,'-.r','LineWidth',1.0);
hold off;
ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex');
title('Q', 'Interpreter', 'LaTex');

subplot(m,n,10);
hold on;
load ../data/multiple_0.mat;
plot(t,N_e_disutil*100,'-k','LineWidth',1.0);
load ../data/multiple_1.mat;
plot(t,N_e_disutil*100,'--b','LineWidth',1.0);
load ../data/multiple_2.mat;
plot(t,N_e_disutil*100,'-.r','LineWidth',1.0);
hold off;
ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex');
xlabel('Quarters', 'Interpreter','LaTex');
title('N', 'Interpreter', 'LaTex');

subplot(m,n,11);
hold on;
load ../data/multiple_0.mat;
plot(t,4*infl_e_disutil*100,'-k','LineWidth',1.0);
load ../data/multiple_1.mat;
plot(t,4*infl_e_disutil*100,'--b','LineWidth',1.0);
load ../data/multiple_2.mat;
plot(t,4*infl_e_disutil*100,'-.r','LineWidth',1.0);
hold off;
ylabel({'Annualized', '$\%\Delta$ from ss'}, 'Interpreter','LaTex');
xlabel('Quarters', 'Interpreter','LaTex');
title('$\pi$', 'Interpreter', 'LaTex');

subplot(m,n,12);
hold on;
load ../data/multiple_0.mat;
plot(t,4*i_e_disutil*100,'-k','LineWidth',1.0);
load ../data/multiple_1.mat;
plot(t,4*i_e_disutil*100,'--b','LineWidth',1.0);
load ../data/multiple_2.mat;
plot(t,4*i_e_disutil*100,'-.r','LineWidth',1.0);
hold off;
ylabel({'Annualized', '$\%\Delta$ from ss'}, 'Interpreter','LaTex'); 
xlabel('Quarters', 'Interpreter','LaTex');
title('i', 'Interpreter', 'LaTex');

legend({'Baseline labor supply shock (\rho_i = 0.8)', ...
    'Shock with zero smoothing coefficient (\rho_i = 0.0)', ...
    'Shock with with larger smoothing coefficient (\rho_i = 0.95)'});

cd ..
f = gcf;

% exportgraphics(f,'../monetary-parameters-1.png','Resolution',300);

% subplot(m,n,1);
% load ../data/multiple_0.mat;
% plot(t,disutil_e_disutil*100,'k','LineWidth',1.0);
% ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex');
% title('Disutility of work', 'Interpreter', 'LaTex');
% 
% subplot(m,n,2);
% hold on;
% load ../data/multiple_0.mat;
% plot(t,4*R_e_disutil*100,'-k','LineWidth',1.0);
% load ../data/multiple_3.mat;
% plot(t,4*R_e_disutil*100,'--b','LineWidth',1.0);
% load ../data/multiple_4.mat;
% plot(t,4*R_e_disutil*100,'-.r','LineWidth',1.0);
% hold off;
% ylabel({'Annualized', '$\%\Delta$ from ss'}, 'Interpreter','LaTex'); 
% title('R', 'Interpreter', 'LaTex');
% 
% subplot(m,n,3);
% plot(t,4*prem_e_disutil*100,'k','LineWidth',1.0);
% hold on;
% load ../data/multiple_0.mat;
% plot(t,4*prem_e_disutil*100,'-k','LineWidth',1.0);
% load ../data/multiple_3.mat;
% plot(t,4*prem_e_disutil*100,'--b','LineWidth',1.0);
% load ../data/multiple_4.mat;
% plot(t,4*prem_e_disutil*100,'-.r','LineWidth',1.0);
% hold off;
% ylabel({'Annualized', '$\%\Delta$ from ss'}, 'Interpreter','LaTex'); 
% title('$E\left[R_{k}\right]-R$', 'Interpreter','LaTex');
% 
% subplot(m,n,4);
% hold on;
% load ../data/multiple_0.mat;
% plot(t,Y_e_disutil*100,'-k','LineWidth',1.0);
% load ../data/multiple_3.mat;
% plot(t,Y_e_disutil*100,'--b','LineWidth',1.0);
% load ../data/multiple_4.mat;
% plot(t,Y_e_disutil*100,'-.r','LineWidth',1.0);
% hold off;
% ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex');
% title('Y', 'Interpreter', 'LaTex');
% 
% subplot(m,n,5);
% hold on;
% load ../data/multiple_0.mat;
% plot(t,C_e_disutil*100,'-k','LineWidth',1.0);
% load ../data/multiple_3.mat;
% plot(t,C_e_disutil*100,'--b','LineWidth',1.0);
% load ../data/multiple_4.mat;
% plot(t,C_e_disutil*100,'-.r','LineWidth',1.0);
% hold off;
% ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex');
% title('C', 'Interpreter', 'LaTex');
% 
% subplot(m,n,6);
% hold on;
% load ../data/multiple_0.mat;
% plot(t,I_e_disutil*100,'-k','LineWidth',1.0);
% load ../data/multiple_3.mat;
% plot(t,I_e_disutil*100,'--b','LineWidth',1.0);
% load ../data/multiple_4.mat;
% plot(t,I_e_disutil*100,'-.r','LineWidth',1.0);
% hold off;
% ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex');
% title('I', 'Interpreter', 'LaTex');
% 
% subplot(m,n,7);
% hold on;
% load ../data/multiple_0.mat;
% plot(t,K_e_disutil*100,'-k','LineWidth',1.0);
% load ../data/multiple_3.mat;
% plot(t,K_e_disutil*100,'--b','LineWidth',1.0);
% load ../data/multiple_4.mat;
% plot(t,K_e_disutil*100,'-.r','LineWidth',1.0);
% hold off;
% ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex');
% title('K', 'Interpreter', 'LaTex');
% 
% subplot(m,n,8);
% hold on;
% load ../data/multiple_0.mat;
% plot(t,L_e_disutil*100,'-k','LineWidth',1.0);
% load ../data/multiple_3.mat;
% plot(t,L_e_disutil*100,'--b','LineWidth',1.0);
% load ../data/multiple_4.mat;
% plot(t,L_e_disutil*100,'-.r','LineWidth',1.0);
% hold off;
% ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex');
% title('L', 'Interpreter', 'LaTex');
% 
% subplot(m,n,9);
% hold on;
% load ../data/multiple_0.mat;
% plot(t,Q_e_disutil*100,'-k','LineWidth',1.0);
% load ../data/multiple_3.mat;
% plot(t,Q_e_disutil*100,'--b','LineWidth',1.0);
% load ../data/multiple_4.mat;
% plot(t,Q_e_disutil*100,'-.r','LineWidth',1.0);
% hold off;
% ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex');
% title('Q', 'Interpreter', 'LaTex');
% 
% subplot(m,n,10);
% hold on;
% load ../data/multiple_0.mat;
% plot(t,N_e_disutil*100,'-k','LineWidth',1.0);
% load ../data/multiple_3.mat;
% plot(t,N_e_disutil*100,'--b','LineWidth',1.0);
% load ../data/multiple_4.mat;
% plot(t,N_e_disutil*100,'-.r','LineWidth',1.0);
% hold off;
% ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex');
% xlabel('Quarters', 'Interpreter','LaTex');
% title('N', 'Interpreter', 'LaTex');
% 
% subplot(m,n,11);
% hold on;
% load ../data/multiple_0.mat;
% plot(t,4*infl_e_disutil*100,'-k','LineWidth',1.0);
% load ../data/multiple_3.mat;
% plot(t,4*infl_e_disutil*100,'--b','LineWidth',1.0);
% load ../data/multiple_4.mat;
% plot(t,4*infl_e_disutil*100,'-.r','LineWidth',1.0);
% hold off;
% ylabel({'Annualized', '$\%\Delta$ from ss'}, 'Interpreter','LaTex');
% xlabel('Quarters', 'Interpreter','LaTex');
% title('$\pi$', 'Interpreter', 'LaTex');
% 
% subplot(m,n,12);
% hold on;
% load ../data/multiple_0.mat;
% plot(t,4*i_e_disutil*100,'-k','LineWidth',1.0);
% load ../data/multiple_3.mat;
% plot(t,4*i_e_disutil*100,'--b','LineWidth',1.0);
% load ../data/multiple_4.mat;
% plot(t,4*i_e_disutil*100,'-.r','LineWidth',1.0);
% hold off;
% ylabel({'Annualized', '$\%\Delta$ from ss'}, 'Interpreter','LaTex'); 
% xlabel('Quarters', 'Interpreter','LaTex');
% title('i', 'Interpreter', 'LaTex');
% 
% legend({'Baseline labor supply shock ($\rho_i = 0.8, \kappa_\pi = 1.5, \kappa_y = 0.5/4$)', ...
%     'Shock with pre-Volcker monetary policy parameters ($\rho_i = 0.8, \kappa_\pi = 1.65, \kappa_y = 0.68/4$)', ...
%     'Shock with Great Moderation monetary policy parameters ($\rho_i = 0.8, \kappa_\pi = 1.77, \kappa_y = 0.32/4$)'}, ...
%     'Interpreter', 'latex');
% 
% cd ..
% f = gcf;

%exportgraphics(f,'../monetary-parameters-2.png','Resolution',300);
%saveas(gcf, 'monetary_params_2_irf', 'pdf') %Save figure