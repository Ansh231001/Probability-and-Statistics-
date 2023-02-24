clc;
clear all;
format short;
c = [2 3 4 7];
a = [2 3 -1 4; 1 -2 6 7];
b = [8; -3];
n = size(a,2);
m = size(a,1);

sol = [];
if(n >= m)
        ns = nchoosek(n,m);
        t = nchoosek(1:n,m);
        for i = 1:ns
              y = zeros(n,1);
              x=a(:,t(i,:))\b;
              if(x > 0)
                   y(t(i,:)) = x;
                   sol = [sol y];
              end
        end


else
    printf("error");
end

sol = (transpose(sol));
value = sol*transpose(c);
[obj_val, index] = max(value);
max(value);
x1 = sol(index,1);
x2 = sol(index,2);
x3 = sol(index,3);
x4 = sol(index,4);




