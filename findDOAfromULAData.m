close all; clear all;

addpath /Users/swrangsarbasumatary/Desktop/advSignalProcAsgn4/ch6/
addpath /Users/swrangsarbasumatary/Desktop/advSignalProcAsgn4/

%% do beamforming 

ULAData = getMonteCarloUlaData(50, 15);
NumberOfAnglesToCheckFor = 64;

phi = beamform(ULAData, NumberOfAnglesToCheckFor, 0.5);
figure(100); clf;
plot(phi); axis tight;
title('Beamforming data');


%% do Capon beamforming 

phiCapon = capon_sp(ULAData, NumberOfAnglesToCheckFor, 0.5);
figure(200); clf;
plot(phiCapon); axis tight;
title('Capon beamforming data');

%% do root MUSIC and plot spectrum

doaMusic = root_music_doa(ULAData, 2, 0.5) .* (pi/180);
rootMusicSpectrum = getSpectrum(doaMusic);
w = -(length(rootMusicSpectrum)/2):(length(rootMusicSpectrum)/2)-1;
w = 180 * w ./ length(rootMusicSpectrum);
figure(300); clf;
plot(w, rootMusicSpectrum);
axis tight;
title('Root Music spectrum of ULA data');
xlabel('Angles in degrees');

%% do  ESPRIT and plot spectrum

doaESPRIT = esprit_doa(ULAData, 2, 0.5) .* (pi/180);
espritSpectrum = getSpectrum(doaESPRIT);
w = -(length(espritSpectrum)/2):(length(espritSpectrum)/2)-1;
w = 180 * w ./ length(espritSpectrum);
figure(400); clf;
plot(w, espritSpectrum);
axis tight;
title('ESPRIT spectrum of ULA data');
xlabel('Angles in degrees');


rmpath /Users/swrangsarbasumatary/Desktop/advSignalProcAsgn4/
rmpath /Users/swrangsarbasumatary/Desktop/advSignalProcAsgn4/ch6/