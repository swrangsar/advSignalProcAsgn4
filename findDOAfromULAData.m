close all; clear all;

addpath /Users/swrangsarbasumatary/Desktop/advSignalProcAsgn4/ch6/
addpath /Users/swrangsarbasumatary/Desktop/advSignalProcAsgn4/

%% do beamforming 

ULAData = getMonteCarloUlaData(50, 15);
phi = beamform(ULAData, 64, 0.5);
figure(100); clf;
plot(phi); axis tight;
title('Beamforming data');

rmpath /Users/swrangsarbasumatary/Desktop/advSignalProcAsgn4/
rmpath /Users/swrangsarbasumatary/Desktop/advSignalProcAsgn4/ch6/