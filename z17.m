%zadaniie 17 naumoff
clc;
% переменные
syms t;
syms s;
syms x(t)
x(t) = (cos(t)^2)+(2*cos(t))-(2*exp(cos(t))) + 1;% точное решение
% метод простых итераций
syms x0(t)
x0(t) = t; % начальное приближение
syms xn(t)
xn(t) = -2/exp(1) - int(sin(s)*(x0(s)+1), s, 0, t) - ((cos(t)^3/3) + 1/3) ;
syms fixed(t)
fixed(t) = 0;
i = 0;
while i < 10
    if i == 5
        fixed = xn;
        out(fixed, x, 6);
    end
    if i == 7
        fixed = xn;
        out(fixed, x, 8);
    end
    x0(t) = xn;
    xn(t) = -2/exp(1) - int(sin(s)*(x0(s)+1), s, 0, t) - ((cos(t)^3/3) + 1/3) ;
    i = i + 1;
end

fixed = xn;
out(fixed, x, 10);

function out = out(f, exact_solution, iteration)
    figure
    hold on;
    grid on;
    axis([-5 20 -2 7]);
    fplot(exact_solution, "-")
    fplot(f, "--")
    title('Iteration', iteration)
    hold off;
    out = 0;
end