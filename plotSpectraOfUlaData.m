function plotSpectraOfUlaData(secondAngle, numberOfAngleSamples)


%% do beamforming 

ULAData = getMonteCarloUlaData(50, secondAngle);

phi = beamform(ULAData, numberOfAngleSamples, 0.5);
figure;
plot(phi); axis tight;
title(['Beamforming data for ', num2str(numberOfAngleSamples), ...
    ' angle samples at \theta_1 = 0 and \theta_2 = ', num2str(secondAngle), ' degrees']);

%% do Capon beamforming 

phiCapon = capon_sp(ULAData, numberOfAngleSamples, 0.5);
figure;
plot(phiCapon); axis tight;
title(['Capon beamforming data for ', num2str(numberOfAngleSamples), ...
    ' angle samples at \theta_1 = 0 and \theta_2 = ', num2str(secondAngle), ' degrees']);

%% do root MUSIC and plot spectrum

doaMusic = root_music_doa(ULAData, 2, 0.5) .* (pi/180);
rootMusicSpectrum = getSpectrum(doaMusic);
w = -(length(rootMusicSpectrum)/2):(length(rootMusicSpectrum)/2)-1;
w = 180 * w ./ length(rootMusicSpectrum);
figure;
plot(w, rootMusicSpectrum);
axis tight;
title(['Root MUSIC spectrum for ', num2str(numberOfAngleSamples), ...
    ' angle samples at \theta_1 = 0 and \theta_2 = ', num2str(secondAngle), ' degrees']);
xlabel('Angles in degrees');

%% do  ESPRIT and plot spectrum

doaESPRIT = esprit_doa(ULAData, 2, 0.5) .* (pi/180);
espritSpectrum = getSpectrum(doaESPRIT);
w = -(length(espritSpectrum)/2):(length(espritSpectrum)/2)-1;
w = 180 * w ./ length(espritSpectrum);
figure;
plot(w, espritSpectrum);
axis tight;
title(['ESPRIT spectrum for ', num2str(numberOfAngleSamples), ...
    ' angle samples at \theta_1 = 0 and \theta_2 = ', num2str(secondAngle), ' degrees']);
xlabel('Angles in degrees');


end