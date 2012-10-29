function ulaData = generateULAData()

end

%% make array transfer vector a(theta)

function directionVector = getDirectionVector(angle, spacing, numberOfSensors, centerFrequency)

wavelength = spacing * 2;
speedOfPropagation = centerFrequency * wavelength;
wc = 2 * pi * centerFrequency;
angle = angle * pi / 180;
k = 1:numberOfSensors;
delay = (k - 1) .* (spacing * sin(angle) / speedOfPropagation);
directionVector = exp(-1i * wc * delay);
directionVector = directionVector(:);

end