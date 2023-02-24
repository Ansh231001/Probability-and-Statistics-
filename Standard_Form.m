clc;
clear all;
format short;
c = [2 4 7];
a = [5 -7 9; -2 -6 0; 6 2 1];
b = [5; 2; 6]
ineq = [0 0 1];
s = eye(size(a,1));
index = find(ineq > 0);
s(index, :) = -s(index, :);
[a s b];
