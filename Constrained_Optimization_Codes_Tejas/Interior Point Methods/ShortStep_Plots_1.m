clc
clear all

load ShortStep_1.txt
load ShortStep_2.txt
load ShortStep_3.txt
load ShortStep_4.txt
load ShortStep_5.txt
load ShortStep_6.txt
load ShortStep_7.txt
%load ShortStep_8.txt


x1 = ShortStep_1(:,1)
x2 = ShortStep_2(:,1)
x3 = ShortStep_3(:,1)
x4 = ShortStep_4(:,1)
x5 = ShortStep_5(:,1)
x6 = ShortStep_6(:,1)
x7 = ShortStep_7(:,1)

plot(x1,'o') 
hold on;
plot(x2,'o')
hold on;
plot(x3,'o')
hold on;
plot(x4,'o')
hold on;
plot(x5,'o')
hold on;
plot(x6,'o')
hold on;
plot(x7,'o')
xlabel('iterations')
ylabel('Factor by which duality gap reduces')
legend('m=5,n=10','m=10,n=30','m=20,n=40','m=30,n=50','m=40,n=60','m=50,n=70','m=60,n=80')
set(gca,'fontname','times','FontSize', 20) 

