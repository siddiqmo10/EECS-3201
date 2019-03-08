%                                                                 Mohammed
%                                                                 Siddiq
%                                                                 213054614  
%                                       
% Introduction -
% In this lab we were familiarising with acquiring and implemnting sound through matlab. 
% We did a bunch of different experiments involving generating sounds from a piano using 
% its frequency and changing amplitudes to check when clipping of sound
% occurs and were introduced to using FFT.



%%
% Equipment - We used a pc and headphones provided in the lab using the matlab
% software to complete the lab.

%%
% Discussion -
% The following consists the results from the lab.

% Question 1 part 1)
a=0:(1/8000):2;  % Implementing the code given in the question 
f=150*a;
x=sin(2*pi*f.*a);
subplot(2,1,1), plot(a,f)
subplot(2,1,2), plot(a,x)
audiowrite('sound1.wav',x,8000);
sound(x,8000);

% (1):
% The number of samples in 1 second are 8000.
% (2):
% The sound heard was in a format of a short high pitch noice carried on
% with a long stretch of constant pitch. This is observed due to a longer 
% wavelength initially ongoing with a decereasing wavelength and period 
% respectively

%%
a=0:(1/8000):0.5;
                     % Implementing the differents notes from the website
                     % given in the question.
                     
f1=261.626*a; % Note 40
f2=293.665*a; % Note 42
f3=329.628*a; % Note 44
f4=349.228*a; % Note 45
f5=391.995*a; % Note 47
f6=440.000*a; % Note 49
f7=493.883*a; % Note 51
f8=523.251*a; % Note 52

x1=sin(2*pi*f1);            % creating the x function that produces the sine wave with the
x2=sin(2*pi*f2);            % different frequencies of the different notes.
x3=sin(2*pi*f3);
x4=sin(2*pi*f4);
x5=sin(2*pi*f5);
x6=sin(2*pi*f6);
x7=sin(2*pi*f7);
x8=sin(2*pi*f8);

u=[x1,x2,x3,x4,x5,x6,x7,x8];

subplot(9,1,1), plot(a,f1)   % ploting all the x functions.
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

audiowrite('Cscale.wav',u,8000);   % creating a new .wav file
sound(u,8000);                     % playing the file.

%% Q2 Part (2)

% The audio video was as expected according to the lab manual.
%% Q2 Part (3)

fs1=4000;       % assigning different frequencies to try according to the question.
fs2=8000;
fs3=16000;


sound(u,fs1);  % playing the file with the different frequencies with a pause in between
pause(8);      % to distinguish betweeen the different frequencies.
sound(u,fs2);
pause(8);
sound(u,fs3);


% Yes, they sound the same as we're using the same notes but the pitch
% varies due to differnt fs values i.e. sampling frequencies.
%% Q2 Part (4)

[Y,fs2]=audioread('Cscale.wav');  % reading the file onto Y.

z= fliplr(u);                     % flipping the waveforrm according to the question using fliplr.
audiowrite('CscaleZ.wav',z,8000);
sound(z,8000);


% CscaleZ.wav starts off with a high pitch and continues to decrease in pitch
% while Cscale.wav starts with a low pitch and increases.

%% Q3  Part (1)

a=0:(1/8000):1;
f1=261.626*a; % Note 40
i=sin(2*pi*f1);

audiowrite('Cmajor.wav',i,8000); % setting the file according to note 40 as the major file.
sound(i,8000);

y =fft(i);                       % taking the fft of the output.
plot(abs(y));                    % plotting to observe what happened when we take the fft.
%% Q3 Part (2)

fs=8000;
[y,fs]=audioread('Cmajor.wav');
plot(y);                          

% From the plot we can see the values are between the range of 1 & -1 which
% is the valid range of data.

%% Q3 Part (3)

a=0:(1/8000):1;
f1=261.626*a; % Note 40
peak =20*sin(2*pi*f1);      % Increasing the peak magnitude.

audiowrite('Cmajor2.wav',peak,8000);
sound(peak,8000);
plot(peak);                    % plotting to see what happens when we increase peak magnitude.

% Yes, a warning was issued saying our data was 'clipped' when writing the
% file. Because the accepted range for y is only from (-1,1) so anything
% outside that is clipped, as shown.

%% Q3 Part (4)

fs=8000;
[CY1,fs]=audioread('Cmajor.wav');    % creating two audio files 
[CY2,fs]=audioread('Cmajor2.wav');

subplot(2,1,1), plot(a,CY1)          % plotting their graphs.
subplot(2,1,2), plot(a,CY2) 
sound(CY1, 8000);
sound(CY2, 8000);              

% They sound the same. However, when the graphs were plotted, we noticed a
% change in the range of y-values of CY2 from (-20,20) instead of (-1,1).

%% Q3 Part (5)

p =fft(CY1);              % Taking fft of both outputs and observing through thier graphs.
p2=fft(CY2);
plot(abs(p));
plot(abs(p2));

% Observation: We observe that the frequency starts from 261.626 (which is
% the frequency of note 40) and later on the graph also plots the
% frequencies of the remaining notes we initially had in the question (i.e.
% notes 42,44,45,47,49,51,52).

%% Q3 Part (6)

[r,fs]=audioread('sound1.wav');
e= 20*r;                          % Increasing the peak magnitude.
audiowrite('sound2.wav',e,8000);
[hm,fs]=audioread('sound2.wav');
sound(e,8000);                   % observing any difference.
pause(3);
sound(x,8000);

b=fft(hm);                      % Taking fft and comparing with file from the first question.
c=fft(r);
subplot(2,1,1), plot(abs(b))
subplot(2,1,2), plot(abs(c))

%%
% Conclusion -

% In this lab we learnt how to make audio files and read them to make sound
% file which we can listen. The prcoess of the getting  familiar with the
% functions for dealing with audio files were confusing in the start of the
% lab but got easier as the lab went on. We achieved finishing all the
% questions given in the lab manual which involved creating audio files and
% clipping them and taking the fft of files as well as making audio files
% of musical instruments by just using the thier frequencies.



