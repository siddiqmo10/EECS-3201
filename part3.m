%% Q3  Part (1)

a=0:(1/8000):1;
f1=261.626*a; % Note 40
i=sin(2*pi*f1);

audiowrite('Cmajor.wav',i,8000);
sound(i,8000);

y =fft(i);
plot(abs(y));
%% Q3 Part (2)

fs=8000;
[y,fs]=audioread('Cmajor.wav');
plot(y);

% From the plot we can see the values are between the range of 1 & -1 which
% is the valid range of data.

%% Q3 Part (3)

a=0:(1/8000):1;
f1=261.626*a; % Note 40
x1=20*sin(2*pi*f1);

audiowrite('Cmajor2.wav',x1,8000);
sound(x1,8000);
plot(x1);

% Yes, a warning was issued saying our data was 'clipped' when writing the
% file. Because the accepted range for y is only from (-1,1) so anything
% outside that is clipped, as shown.

%% Q3 Part (4)

fs=8000;
[CY1,fs]=audioread('Cmajor.wav');
[CY2,fs]=audioread('Cmajor2.wav');

subplot(2,1,1), plot(a,CY1)
subplot(2,1,2), plot(a,CY2)
sound(CY1, 8000);
sound(CY2, 8000);

% They sound the same. However, when the graphs were plotted, we noticed a
% change in the range of y-values of CY2 from (-20,20) instead of (-1,1).

%% Q3 Part (5)

p =fft(CY1);
p2=fft(CY2);
plot(abs(p));
plot(abs(p2));

% Observation: We observe that the frequency starts from 261.626 (which is
% the frequency of note 40) and later on the graph also plots the
% frequencies of the remaining notes we initially had in the question (i.e.
% notes 42,44,45,47,49,51,52).

%% Q3 Part (6)

[r,fs]=audioread('sound1.wav');
e= 20*r;
audiowrite('sound2.wav',e,8000);
[hm,fs]=audioread('sound2.wav');
sound(e,8000);
pause(3);
sound(x,8000);

b=fft(hm);
c=fft(r);
subplot(2,1,1), plot(abs(b))
subplot(2,1,2), plot(abs(c))


