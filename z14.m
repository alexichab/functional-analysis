% Наумов
clc;
A = [-3 9 -2 7; 3 8 0 -9; 5 1 1 2; 4 -4 5 0];
B = [84; 5; 65; 35];

ATA = A' * A; % At * А
D = eig(ATA); % массив собственных чисел матрицы
l = 176.282; % максимальное собственное число матрицы At*A посчитано на листе
I = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1]; % единичная матрица I

% преобразование системы к виду Cx + d = x <=> Ф[x] = Cx + d
C = I - ATA / l;
d = (A' * B) / l;
c = eig(C);
alpha = 0.966; % максимальное собственное число матрицы C посчитано на листе

X = [7, 7, 7, 8]; % точное решение

% метод простых итераций
%1
epsilon = 1e-2; % точность = 10^(-2)
func0 = [1; 2; 1; 1];
func = C * func0 + d;
apriori = int16(round(log(epsilon * (1 - alpha) / ro2(func, func0)) / log(alpha)) + 1);
coef = alpha / (1 - alpha);
i = 0;
while and(i < apriori, coef * ro2(func, func0) > epsilon) % апостериорная оценка
    func0 = func;
    func = C * func0 + d;
    i = i + 1;
end
metric = ro2(X, func);
fprintf("simple iterations: epsilon = %f, apriori = %d iterations\naposteriori = %d iterations, solution metric = %f < %f => solved good\n\n", epsilon, apriori, i, metric, epsilon);
func

%2
epsilon = 1e-4; % точность = 10^(-4)
func0 = [1; 2; 1; 1];
func = C * func0 + d;
apriori = int16(round(log(epsilon * (1 - alpha) / ro2(func, func0)) / log(alpha)) + 1);
coef = alpha / (1 - alpha);
i = 0;
while and(i < apriori, coef * ro2(func, func0) > epsilon) % апостериорная оценка
    func0 = func;
    func = C * func0 + d;
    i = i + 1;
end
metric = ro2(X, func);
fprintf("simple iterations: epsilon = %f, apriori = %d iterations\naposteriori = %d iterations, solution metric = %f < %f => solved good\n\n", epsilon, apriori, i, metric, epsilon);
func

function sum = ro2(xn, xn1)
    sum = 0.0;
    for i = 1 : size(xn, 1)
        sum = sum + (xn(i) - xn1(i)) * (xn(i) - xn1(i));
    end
    sum = sqrt(sum);
end