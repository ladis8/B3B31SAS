clear all;

%HOW Convulation works
conv([2 3 -1], [1 2 -1]);


%UKOL impulsni odezva mistnosti -AUDIO
[h, Fs] = audioread('./impulsni_odezva/imp2.wav');
[u, Fs2]= audioread('./impulsni_odezva/shrek.wav'); %vzorkovaci frekvence Fs --> dana audio souborem u wav by melo byt stejne
%{
u = u - mean(u); %odstraneni stejnosmerneho signalu
h = h - mean(h);
kon=conv(u,h);
sound(kon, Fs2)


%lze rychleji spocitat pomoci Fourierovy transformace
n = length(u) + length(h) -1;


%}
%UKOL sinus prenasobeny libovolnou odezvou je opet sinus
f = 440; 
t1 = (0: length(h)-1)/Fs; 
x1 = sin(2*pi*f*t1);
konv2 = conv (x1, h);
length(t1)

t2 = (0: length(konv2)-1) / Fs;
hold on    %holds the plot to same graph
plot (t1,x1,'g')
plot (t1, h, 'r')
plot (t2, konv2')
hold off