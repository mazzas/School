%% (a)
num0 = [50];
den0 = [1 56 305 250];
sys0 = tf(num0,den0);
num1 = [0.2];
den1 = [1 1];
sys1 = tf(num1,den1);
subplot(1,2,1)
pzmap(sys0)
subplot(1,2,2)
step(sys0,sys1)
legend('original','simplified')
%% (b)
num0 = [100];
den0 = [1 13 32 20];
sys0 = tf(num0,den0);
num1 = [100];
den1 = [1 12 20];
sys1 = tf(num1,den1);
subplot(1,2,1)
pzmap(sys0)
subplot(1,2,2)
step(sys0,sys1)
legend('original','simplified')
%% (c)
num0 = [10];
den0 = [1 7 16 38 48 40];
sys0 = tf(num0,den0);
num1 = [2];
den1 = [1 2 6 8 8];
sys1 = tf(num1,den1);
subplot(1,2,1)
pzmap(sys0)
subplot(1,2,2)
step(sys0,sys1,10)
legend('original','simplified')
%% (d)
num0 = [72 576];
den0 = [1 24 188 576 576];
sys0 = tf(num0,den0);
num1 = [12];
den1 = [1 8 12];
sys1 = tf(num1,den1);
subplot(1,2,1)
pzmap(sys0)
subplot(1,2,2)
step(sys0,sys1)
legend('original','simplified')