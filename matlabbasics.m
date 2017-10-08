
%KVIZ 01
A = [1 2 3; 4 5 6]
sum(A)
A = [5 7 9]
sum(A)
%suma jednotlivych sloupcu u matice, soucet prvku u vektoru


%ERRORS
sum 12
%sum (sum)
%chytaky nefunguji spravne

%MATICOVE NASOBENI
A = [2 1; 1 2]
B = [1 2; 3 4]
A*B     %algebraicke
A.*B

%GENEROVANI
1:1:10 %1...10 s krokem 1
linspace(1, 10, 10) %10 cisel od 1 do 10
10:-1:1
linspace(10,1, 10) %10 cisel od 10 do 1

%PRIORITIES
1:5 + 1 % scitani ma vyssi prioritu nez dvojtecka


%LENGHTS
length(rand(10,2))%vraci nejvetsi rozmer
size(rand(10,2))  %vraci matici rozmeru

