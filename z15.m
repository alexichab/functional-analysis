% НАУМОВ
clc;

syms t; syms f0(t); syms f(t); syms alpha(t);
f0(t) = t; % начальное приближение
f(t) = (t/(f0(t)+1))-sin(15*t); % Ф (t/(f0(t)+1))-sin(15*t)
alpha(t) = 2/3; % коэффициент сжатия
epsilon = 1e-2;
a = -2/3;
b = 2/3;
xn=0;

apriori = int16(round(log(epsilon * (1 - alpha(a)) / maximum(f0, f, a, b)) / log(alpha(a))));
fprintf("alphaMax = %f, eps = %.e, apr = %d\n", alpha(a), epsilon, apriori);

i = 0;
while i < apriori
    f0(t) = xn;
    xn = f(f0);
    i = i + 1;
end

hold on;
grid on;
t = -2/3:0.01:2/3;
u = fun_15(t);
plot(t,u)
title('Приближённое решение нелинейного уравнения C[-2/3;2/3]');
hold off;

function max = maximum(xn1, xn, a, b)
    max = 0.0;
    for i = a:1:b
        value = abs(xn1(i) - xn(i));
        if (value > max)
            max = value;
        end
    end
end

function x = fun_15(t);
f = @(t, x) t / (x + 1) - sin(15 * t);
x = f(t, 5);

for count = 2 : 16
   x0 = x;
   x = f(t, x0);
end
end
