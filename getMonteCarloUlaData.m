function avgUlaData = getMonteCarloUlaData(numberOfRealizations, secondAngle)

m = 10; N = 100;

avgUlaData = generateULAData(m, N, secondAngle);
for k = 1:numberOfRealizations-1
    avgUlaData = avgUlaData + generateULAData(m, N, secondAngle);
end
avgUlaData = avgUlaData ./ numberOfRealizations;

end