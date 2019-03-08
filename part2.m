a=0:(1/8000):0.5;
f1=261.626*a; % Note 40
f2=293.665*a; % Note 42
f3=329.628*a; % Note 44
f4=349.228*a; % Note 45
f5=391.995*a; % Note 47
f6=440.000*a; % Note 49
f7=493.883*a; % Note 51
f8=523.251*a; % Note 52

x1=sin(2*pi*f1);
x2=sin(2*pi*f2);
x3=sin(2*pi*f3);
x4=sin(2*pi*f4);
x5=sin(2*pi*f5);
x6=sin(2*pi*f6);
x7=sin(2*pi*f7);
x8=sin(2*pi*f8);

u=[x1,x2,x3,x4,x5,x6,x7,x8];

subplot(9,1,1), plot(a,f1)
subplot(9,1,2), plot(a,x1)

subplot(9,1,3), plot(a,f2)
subplot(9,1,4), plot(a,x2)

subplot(9,1,5), plot(a,f3)
subplot(9,1,6), plot(a,x3)

subplot(16,1,7), plot(a,f4)
subplot(16,1,8), plot(a,x4)

subplot(16,1,9), plot(a,f5)
subplot(16,1,10), plot(a,x5)

subplot(16,1,11), plot(a,f6)
subplot(16,1,12), plot(a,x6)

subplot(16,1,13), plot(a,f7)
subplot(16,1,14), plot(a,x7)

subplot(16,1,15), plot(a,f8)
subplot(16,1,16), plot(a,x8)

audiowrite('Cscale.wav',u,8000);
sound(u,8000);

%% Q2 PART (2)

% The audio video was as expected according to the lab manual.
%% Q2 Part (3)

fs1=4000;
fs2=8000;
fs3=16000;


sound(u,fs1);
pause(8);
sound(u,fs2);
pause(8);
sound(u,fs3);


% Yes, they sound the same as we're using the same notes but the pitch
% varies due to differnt fs values i.e. sampling frequencies.

%% %% Q2 Part (4)

[Y,fs2]=audioread('Cscale.wav');

z= fliplr(u);
audiowrite('CscaleZ.wav',z,8000);
sound(z,8000);


% CscaleZ.wav starts off with a high pitch and continues to decrease in pitch
% while Cscale.wav starts with a low pitch and increases.


