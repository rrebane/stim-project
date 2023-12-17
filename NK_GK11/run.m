%********************************************************
%Run and plot IRFs in Fig.1. for the financial accelerator case in  Gertler, M. and Karadi, P. ``A Model of Unconvetional Monetary Policy''
%In: Journal of Monetary Economics (2011)
 
%********************************************************

clear all;
clc;
close all;

%adjust path to folder where replication file is stored
cd([cd '/NK_GK11_rep']);

%run replication dynare file
dynare NK_GK11_rep;

%load results
load NK_GK11_rep_results.mat;

 
t=1:1:40;
 
% m=4;
% n=4;
% 
% figure('name','Impulse responses','numbertitle','off') 
% subplot(m,n,2);
% plot(t,Y_e_a,'k','LineWidth',1.5);  
% ylabel([{'a'};{'$\%\Delta$ from ss'}], 'Interpreter','LaTex'); 
% title('Y');
% 
% subplot(m,n,3);
% plot(t,I_e_a,'k','LineWidth',1.5);  
% ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex'); 
% title('I');
% 
% subplot(m,n,4);
% plot(t,4*prem_e_a,'k','LineWidth',1.5);  
% ylabel('Annualized $\%\Delta$ from ss', 'Interpreter','LaTex'); 
% title('$E\left[R_{k}\right]-R$', 'Interpreter','LaTex');
% 
% 
% subplot(m,n,6);
% plot(t,Y_e_i,'k','LineWidth',1.5); 
% ylabel([{'m'};{'$\%\Delta$ from ss'}], 'Interpreter','LaTex'); 
% title('Y');
% 
% subplot(m,n,7);
% plot(t,I_e_i,'k','LineWidth',1.5);  
% ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex'); 
% title('I');
% 
% subplot(m,n,8);
% plot(t,4*prem_e_i,'k','LineWidth',1.5);  
% ylabel('Annualized $\%\Delta$ from ss', 'Interpreter','LaTex'); 
% title('$E\left[R_{k}\right]-R$', 'Interpreter','LaTex');
% 
% 
% subplot(m,n,10);
% plot(t,Y_e_Ne,'k','LineWidth',1.5); 
% ylabel([{'N'};{'$\%\Delta$ from ss'}], 'Interpreter','LaTex'); 
% title('Y');
% 
% subplot(m,n,11);
% plot(t,I_e_Ne,'k','LineWidth',1.5);  
% ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex'); 
% title('I');
% 
% subplot(m,n,12);
% plot(t,4*prem_e_Ne,'k','LineWidth',1.5);  
% ylabel('Annualized $\%\Delta$ from ss', 'Interpreter','LaTex'); 
% title('$E\left[R_{k}\right]-R$', 'Interpreter','LaTex');
% 
% 
% subplot(m,n,14);
% plot(t,Y_e_zeta,'k','LineWidth',1.5); 
% ylabel([{'$\zeta$'};{'$\%\Delta$ from ss'}], 'Interpreter','LaTex'); 
% title('Y');
% 
% subplot(m,n,15);
% plot(t,I_e_zeta,'k','LineWidth',1.5);  
% ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex'); 
% title('I');
% 
% subplot(m,n,16);
% plot(t,4*prem_e_zeta,'k','LineWidth',1.5);  
% ylabel('Annualized $\%\Delta$ from ss', 'Interpreter','LaTex'); 
% title('$E\left[R_{k}\right]-R$', 'Interpreter','LaTex');
% 
% close;

m=4;
n=3;

subplot(m,n,1);
plot(t,zeta_e_zeta,'k','LineWidth',1.5);
ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex');
title('$\zeta$', 'Interpreter', 'LaTex');

subplot(m,n,2);
plot(t,R_e_zeta,'k','LineWidth',1.5);
title('R', 'Interpreter', 'LaTex');

subplot(m,n,3);
plot(t,Rk_e_zeta-R_e_zeta,'k','LineWidth',1.5);
title('$R^k - R$', 'Interpreter', 'LaTex');

subplot(m,n,4);
plot(t,Y_e_zeta,'k','LineWidth',1.5);
ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex');
title('Y', 'Interpreter', 'LaTex');

subplot(m,n,5);
plot(t,C_e_zeta,'k','LineWidth',1.5);
title('C', 'Interpreter', 'LaTex');

subplot(m,n,6);
plot(t,I_e_zeta,'k','LineWidth',1.5);
title('I', 'Interpreter', 'LaTex');

subplot(m,n,7);
plot(t,K_e_zeta,'k','LineWidth',1.5);
ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex');
title('K', 'Interpreter', 'LaTex');

subplot(m,n,8);
plot(t,L_e_zeta,'k','LineWidth',1.5);
title('L', 'Interpreter', 'LaTex');

subplot(m,n,9);
plot(t,Q_e_zeta,'k','LineWidth',1.5);
title('Q', 'Interpreter', 'LaTex');

subplot(m,n,10);
plot(t,N_e_zeta,'k','LineWidth',1.5);
ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex');
title('N', 'Interpreter', 'LaTex');

subplot(m,n,11);
plot(t,Rk_e_zeta,'k','LineWidth',1.5);
title('$\pi$', 'Interpreter', 'LaTex');

subplot(m,n,12);
plot(t,i_e_zeta,'k','LineWidth',1.5);
title('i', 'Interpreter', 'LaTex');

% close;
% 
% m=1;
% n=4;
% 
% subplot(m,n,1);
% plot(t,zeta_e_zeta,'k','LineWidth',1.5);
% ylabel('$\%\Delta$ from ss', 'Interpreter','LaTex');
% title('$\zeta$', 'Interpreter', 'LaTex');
% 
% subplot(m,n,2);
% plot(t,varrho_e_zeta,'k','LineWidth',1.5);
% title('$\varrho$ (marginal utility of consumption)', 'Interpreter', 'LaTex');
% 
% subplot(m,n,3);
% plot(t,w_e_zeta,'k','LineWidth',1.5);
% title('w (wages)', 'Interpreter', 'LaTex');
% 
% subplot(m,n,4);
% plot(t,L_e_zeta,'k','LineWidth',1.5);
% title('L (labor supply of households)', 'Interpreter', 'LaTex');

cd ..
% saveas(gcf, 'irf_fig_1_FA', 'pdf') %Save figure