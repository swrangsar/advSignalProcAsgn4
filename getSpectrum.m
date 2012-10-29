function estimatedSpectrum = getSpectrum(frequencyEstimates)

N=100;
t = 1:N;

x = zeros(size(t));
for k = 1:length(frequencyEstimates)
    x = x + (exp(1i * frequencyEstimates(k) .* t));
end

% now get the spectrum using fft

M = 2 ^ nextpow2(4 * length(x));
estimatedSpectrum = 10 * log10(abs(fftshift(fft(x, M))));
L = length(estimatedSpectrum); % we want only -pi/2 to pi/2
estimatedSpectrum = estimatedSpectrum(round(L/4):round(3 * L/4));

end