
%AUDIO
[y, Fs] = audioread('./AUDIO/ozvena.mp3');

%tOsa = (0: length(y)) / Fs; chyba vektor musi byt stejne delky
tOsa = (0: length(y)-1) / Fs;
plot(tOsa, y);

xlabel('Čas (s)'); ylabel('Amplituda')
axis tight; grid


sound (y, Fs)
