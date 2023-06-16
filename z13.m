% НАУМОВ
clc;
epsilon = 1e-5; % точность
v = 0.0943951;
u = 5.0944;
alpha = 0.981471;
coef = alpha / (1 - alpha);
% преобразованная функция вида Ф[x] = x
f = inline("x-(1/5.0944)*((2*pi/3)*x+(sqrt(3)*cos(x))+sin(x)+atan(x))");
x0 = f(1); % начальное приближение
xn = f(x0);

apriori = 825;

i = 0;
while and(i < apriori, coef * abs(xn - x0) > epsilon) % апостериорная оценка
    x0 = xn;
    xn = f(x0);
    i = i + 1;
end
fprintf("epsilon = %f, v = %f, u = %f, alpha = %f\napriori = %d iterations\nx = %f, %d iterations\n", epsilon, v, u, alpha, apriori, xn, i);
