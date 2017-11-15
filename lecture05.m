
%Cviceni 5
clear all

%{
UKOL
1.) vygenerovat 1 sekundu signálu cosinus, zobrazit amplitudové i fázové spektrum
2.) změnit dobu trvání = 1.05 sekundy (nebo např. trvání = 1 a f = 9.5 Hz)
3.) zpět dobu trvání na 1 sekundu, přičíst stejnosměrnou složku 0.4
4.) přičíst další složku - tentokrát sinus 15 Hz a poloviční amplituda
%}

fs = 100; % vzorkovací kmitočet [Hz]
f = 20; % frekvence cosinu [Hz]
%90 Hz sinus dopadne pri vzorkovani 100 jako normalni sinusovka
A = 1; % amplituda
t = 5;

tO = (0:t*fs -1)/fs;
signal = A * sin(2*pi*f*tO);
F = fft(signal)/length(signal);
f = 0: fs/length(F): fs - fs/length(F); %spravne oznaceni os - dulezite odecist posledni delta
%vzorkovacka 100 vzorku -- fft ma take 100 frekvenci --> frekvenci krok 1
%Hz

subplot(2,1,1);
plot(f, abs(F));
subplot(2,1,2);
plot(f, angle(F));

%{
Domácí úkol (aktivita): z přednášky vzít vzorec na obdélník ve složkovém tvaru FŘ, sečíst několik prvních harmonických - délku signálu zvolit na celý počet period, zobrazit signál a jeho spektrum pomocí fft.
%}



