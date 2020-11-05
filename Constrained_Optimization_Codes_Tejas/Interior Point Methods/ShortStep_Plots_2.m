clc
clear all

load ShortStep_11.txt
load ShortStep_22.txt
load ShortStep_33.txt
load ShortStep_44.txt
load ShortStep_55.txt
load ShortStep_66.txt
load ShortStep_77.txt
load ShortStep_88.txt
load ShortStep_99.txt
%load ShortStep_1010.txt
%load NBH.txt


x1 = ShortStep_11(:,1)
x2 = ShortStep_22(:,1)
x3 = ShortStep_33(:,1)
x4 = ShortStep_44(:,1)
x5 = ShortStep_55(:,1)
x6 = ShortStep_66(:,1)
x7 = ShortStep_77(:,1)
x8 = ShortStep_88(:,1)
x9 = ShortStep_99(:,1)
%x10 = ShortStep_1010(:,1)

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
hold on;
plot(x8,'o')
hold on;
plot(x9,'o')
%hold on;
%plot(x10,'o')

xlabel('iterations')
ylabel('Factor by which duality gap reduces')
legend('m=20,n=30','m=20,n=40','m=20,n=50','m=20,n=60','m=20,n=70','m=20,n=80','m=20,n=100','m=20,n=200','m=20,n=500')
set(gca,'fontname','times','FontSize', 20) 

