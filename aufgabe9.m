%% Aufgabe 9 
% Test code: 
function [] = aufgabe9()
xzeros = a9();
check (length(xzeros) == 3, "Wir suchen 3 Nullstellen!" )
lhs=@(x) tan(x);
rhs=@(x) x.*log(x/10);
for i = 1:length(xzeros)
    % inside interval:
    xzero=xzeros(i);
    check (isfinite(lhs(xzero)), ...
        "lhs ist nicht diefiniert an dieser Stelle\n " )
    check (isfinite(rhs(xzero)), ...
        "rhs ist nicht diefiniert an dieser Stelle\n " )  
    check (1e-5 > abs(lhs(xzero)- rhs(xzero)), "Das ist keine Nullstelle!" )
end
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

%% Aufgabe 9: Finde Schnittpunkte (5 Punkte)
function [xroots] = a9()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Finden Sie alle Lösungen der Gleichung tan(x) = x * log(0.1 x)
% im Intervall x \in (0, 10]. Geben Sie alle Nullstellen zurück.
%% Ihr Code:
    % Funktion, die die Gleichung tan(x) = x * log(x/10) repräsentiert
    function y = f(x)
        y = tan(x) - x .* log(x ./ 10);
    end

    % Definiere spezifische Startpunkte
    start_points = [1, 3, 7]; % Diese Werte können angepasst werden
    xroots = zeros(1, 3);

    % Suche Nullstellen bei gegebenen Startpunkten
    for i = 1:length(start_points)
        x0 = start_points(i);
        xroot = fsolve(@f, x0, optimoptions('fsolve', 'Display', 'none'));
        
        % Überprüfen, ob die Nullstelle im gültigen Bereich liegt
        if xroot > 0 && xroot <= 10
            xroots(i) = xroot;
        else
            error('Keine gültige Nullstelle gefunden.');
        end
   
    end

    % Sortiere die gefundenen Nullstellen
    xroots = sort(xroots);
    % Schöne Ausgabe der Nullstellen
    for i = 1:length(xroots)
        fprintf('Nullstelle %d: %f\n', i, xroots(i));
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end





