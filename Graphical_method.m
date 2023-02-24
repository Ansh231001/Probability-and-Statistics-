clc
clear all;
A=[2 4; 3 5];
B=[8;15];
x1=0:1:max(B);
x2=(B(1)-A(1,1)*x1)/A(1,2);
x_2=(B(2)-A(2,1)*x1)/A(2,2);

x2=max(0,x2);
x_2=max(0,x_2);
plot(x1,x2,x1,x_2)
legend('x2','x_2');
cy=find(x1==0);
cx=find(x2==0);
line1_cp=[x1([cx(1),cy]);x2([cx(1),cy])]';

cy1=find(x1==0);
cx1=find(x_2==0);
line2_cp=[x1([cx1(1),cy1]);x_2([cx1(1),cy1])]';
corpt=unique([line1_cp;line2_cp],'rows');

pt=[];
for i=1: size(A,1)
    A1=A(i,:);
    B1=B(i,:);
    for j=i+1 :size(A,1)
        A2=A(j,:);
        B2=B(j,:);
        A4=[A1;A2];
        B4=[B1;B2];
        X4=A4\B4;
        pt=[pt X4];
    end
end
intpt=transpose(pt);
allpt=[intpt;corpt];
points=unique(allpt,'rows');

for i=1:size(points,1)
    const1(i)=A(1,1)*points(i,1)+A(1,2)*points(i,2)-B(1);
    const2(i)=A(2,1)*points(i,1)+A(2,2)*points(i,2)-B(2);
    s1=find(const1>0);
    s2=find(const2>0);
end
s=unique([s1 s2]);
points(s,:)=[];
c=[3;2];
value=points*c;
[obj_val,index]=max(value);
x1=points(index,1);
x2=points(index,2);
fprintf('objective function is %f at (%f,%f)',obj_val,x1,x2);