

%CVICENI 06
%FFT... n vzorku signalu -> n vzorku spektra

%{
%UKOL1 FFT klaviru a fletny
%[signal, fs] = audioread('./zvuky_klavir_fletna/klavir.wav');
[signal, fs] = audioread('./zvuky_klavir_fletna/fletna.wav');
length (signal)
tO = 0:1/fs:(length(signal)-1)/fs;
%sound(signal,fs);
F = fft(signal)/length(signal);
f = 0: fs/length(F): fs - fs/length(F); %spravny popis

subplot(2,1,1);
plot(f,abs(F));
xlim([0,5000]);     %vycet 0-5000
subplot(2,1,2);
plot(f,20 * log10(abs(F)));      %QUESTION: je to sparvne???
xlim([0,5000]);



%UKOL2 Aliasing
fs=8000; f=7700; trvani=1
tO= 0:1/fs:trvani -1/fs;
signal= 0.8*cos(2*pi*f*t);
F = fft(signal)/length(signal);
f = 0: fs/length(F): fs - fs/length(F); %spravny popis

figure
plot(f,abs(F));
xlim([0,5000]);
sound(signal, fs)

%QUESTION: co presne to rika



%UKOL3 Frekvencni charakteristika

[u, fs] = audioread('shrek.wav');
 
% filtr simulující přenos analogovým telefonem
Wp = [300 3400]/(fs/2); Ws = [50 3800]/(fs/2); Rp = 1; Rs = 30;
[n, Wp] = ellipord(Wp, Ws, Rp, Rs); [b, a] = ellip(n,Rp,Rs,Wp);
 
figure
freqz(b, a, 1000, fs)  % vykreslení frekvenční charakteristiky
[H, f] = freqz(b, a, length(u), 'whole', fs);  % získání frekvenční charakteristiky H
 
figure
subplot(2,1,1);
plot(f, abs(H))  % vykreslení bez dB
xlim([0,5000]);
 
U = fft(u);   % spektrum vstupu
Y = U .* H;   % násobení spektra s frekvenční charakteristikou
y = ifft(Y);  % převod do časové oblasti
tO = (0:length(y)-1)/fs;
subplot(2,1,2);
plot(tO,y); 
sound(y, fs);



%}
%UKOL 4 FFT with zeros
%vice car ve spektru = prosakovani ve spektru

fs = 100;t = 0.5;f = 11; A = 5;
tO = 0:1/fs:t-1/fs;
signal = A*cos(2*pi*f*tO);

F = fft(signal)/length(signal);
fx = 0: fs/length(F): fs - fs/length(F); %spravny popis
subplot (3,1,1)
stem(fx,abs(F))

deltaF= fs/length(signal)   %frekvencni rozliseni

%SIGNAL WINDOWING ---> odstrani kopecky pri doplneni nulama
okno = hamming(length(signal)+1).'; okno = okno(1: end-1);
signal = signal .* okno;   % násobíme ještě před doplněním nulami


tp = 5;                             %cas na ktery prodluzuji
signal =[signal, zeros(1,fs*tp)];    %spojeni signalu nulami
F = fft(signal)/length(signal);
fx = 0: fs/length(F): fs - fs/length(F); %spravny popis
subplot(3, 1, 2)
plot(fx,abs(F))

%QUESTION: vysvetleni



%{






subplot(3,1,2)
plot(fx,abs(F));
subplot(3,1,3)
plot(fx,angle(F));

%}

