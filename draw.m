y = 1;
step  = 0.1;

for i = 1:5
    dif = 2 - exp(-4.*i) - 2.*y;
    y = y + step.*dif;
end

plot(i,y);