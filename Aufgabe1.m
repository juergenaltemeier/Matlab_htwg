
%% Aufgabe 1 : Datentypen (5 Punkte)
% Finden Sie heraus was der Datentyp von a ist.
a=4;
% Was ist der maximal wert den der Datentyp von a abspeichern kann?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ihr Code:
dataTypeOfa = class(a);
maxValueOfa = realmax(dataTypeOfa);
fprintf("%s %e", dataTypeOfa,maxValueOfa);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Aufgabe 2 : Vektoren und Matrizen (5 Punkte)
% Erstellen Sie einen Vektor b, mit der Dimension 1x50 in dem die Zahlen von 1
% bis 50 gespeichert sind.
% Speichern Sie die ersten 5 geraden Zahlen in der Variable c.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ihr Code:
b = 1:50;
c = b(2:2:10); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%