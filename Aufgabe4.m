%% Aufgaben Block 4: Abgabe bis 13.12.2023
% Test code: 
function [] = Aufgabe4()
[m,b] = a7();
check (abs(m-3.0) < 0.02, ...
    sprintf("Steigung ist falsch m = %f fehler : %f ",m, abs(m-3.0)))
check (abs(b- (-2.5)) < 0.02, ...
    sprintf("Offset ist falsch b=%f fehler : %f ", b, abs(b-(-2.5))) )

end

function check(eval_bool, msg)
%CHECK prüft einzelne Ergebnisse (eval_bool). 
% Falls das Ergebnis falsch ist, wird die Botschaft (msg) ausgegeben.
% Sonst wird nichts unternommen.
if (~eval_bool)
    fprintf("ERROR: ")
    fprintf(msg)
    fprintf('\n')
end
end

%% Aufgabe 7: Lineare Regession (5 Punkte)
function [m,b] = a7()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% lesen Sie die Datei "linear_data.csv" ein.
% Verweden sie die Daten in der ersten Spalte als x, die Daten aus der 
% zweiten Splate sind y. 
% Diese Werte folgen dem Gesetzt: y = m * x + b 
% Finden Sie die Werte für m und b (auf den Messungen y ist ein Messfehler)
% geben Sie m und b zurück.
%% Ihr Code:
data = readtable('linear_data.csv');
x = data{:, 1};
y = data{:, 2};
c = polyfit(x,y,1);
m = c(1);
b = c(2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
