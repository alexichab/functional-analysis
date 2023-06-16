%zadanie 16 naumoff
clc; syms t; syms s; syms f0(t); syms f(t); syms solution(t);
alpha = 1/2;
eps = 1e-3;
f0(t) = t;
f(t) = (1/2) * int(f0(s) * s*(t+1), s, 0, 1) + t^3;
apriori = 12;
fprintf("lambda = 1/7, alpha = %f, eps = %.e, apriori = %d iterations\n", alpha, eps, apriori);
i = 0;
while i < apriori
    f0(t) = f(t);
    f(t) = (1/2) * int(f0(s) * s*(t+1), s, 0, 1) +t^3;
    i = i + 1;
end
f(t) % вывод приближённого решения

solution(t) = (6*t/35) + (6/35) + (t^3); % точное решение

m = maximum(solution, f, 0, 1); % расстояние между приближённым и точным решением
fprintf("max = %f", m);
t = 0:0.01:1;
hold on;
grid on;
plot(t,f(t), "-");
plot(t,solution(t), "--");
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