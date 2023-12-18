%% Aufgabe 8 
% Test code: 
function [] = aufgabe8()
xmin = a8();
check ( 0.0001 > abs (xmin - 0) , "das Minimum ist nicht richtig!" )

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

%% Aufgabe 8: Minimierung ohne Nebenbedingungen (2 Punkte)
function [xmin] = a8()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% finden sie die Minimas der Funktion f(x) = -x^2 - 5 *exp(-x^ 2 ) auf dem
% Intervall x \in [-2.5, 2.5]
% Geben Sie das gefundene Minimum in xmin zurück.
%% Ihr Code:
fun = @(x) -x.^2 - 5 * exp(-x.^2); %.^ für Elementweise Anwendung
xmin = fminbnd(fun, -2.5, 2.5); %Interval definieren

fprintf('Minimas: %e\n', xmin);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end





