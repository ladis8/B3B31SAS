%TEORIE
%zatlumeni 0 db == zadna zmena amplitudy
%zatlumeni na nulovou amplitudu == -nekonecno db
%pomer amplitud 70 % == -3db
%SPL db ...db akustickeho tlaku vztazene ke kalibrovane hodnote
%FS db ... db relativni k rozsahu sinusovky
%referenční hladina 0 dB FS je přiřazena sinusovce s maximální možnou amplitudou, kterou lze při daném kvantování bez zkreslení uložit. 
%bily sum
%SNR db ... pomer uzitecne slozky vuci sumu
%SNR 0 db == stejny pomer

clear all
Fs = 1000
f= 50
t= 1
amp = 0.5
tO= (0:t*Fs-1)/Fs;

%UKOL 1
x1= sin(2*pi*f*tO);
x2= amp*square(2*pi*f*tO);
x3= amp* sawtooth(2*pi*f*tO);
sound (x3)
plot (tO,[x1',x2',x3'])

disp( ['Vykon sinu je: ', num2str(vykon(x1))])
disp( ['Vykon ctverce je: ', num2str(vykon(x2))])
disp( ['Vykon pily je: ', num2str(vykon(x3))])

%UKOL 2 Voltage
Uef= 230;
Ampl= Uef/sqrt(vykon(x1))


dbfs1 = 10*log10(vykon(x1)/vykon(x1))
dbfs1 = 10*log10(vykon(x2)/vykon(x1))
dbfs1 = 10*log10(vykon(x3)/vykon(x1))

%Vykon obdelniku s polovicni amplitudou 
amplpolovicni= vykon (x2)
%dbFS obdelniku s polovicni amplitudou 
amplpolovicni= 10*log10(vykon(x3)/0.5)

%Zesileni signalu o dany pocet decibelu
sig = x1 * sqrt(10^(0.5/10));
g = 10*log10(vykon(sig)/0.5)


  


