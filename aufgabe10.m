%% Aufgabe10
% Test code: 
function [] = aufgabe10()
xzeros = a10(30);
%% Es gibt hier keine tests.

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

%% Aufgabe 10: Zusatz (1 Punkte)
function [xroots] = a10(xmax)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Finden Sie alle Lösungen der Gleichung tan(x) = x * log(0.1 x)
% im Intervall x \in (0, xmax]. Geben Sie alle Nullstellen zurück.
%% Ihr Code:
    % Funktion, die die Gleichung tan(x) = x * log(x/10) repräsentiert
    function y = f(x)
        y = tan(x) - x .* log(x ./ 10);
    end

    % Initialisiere ein leeres Array für die Nullstellen
    xroots = [];

    % Wähle mehrere Startpunkte im Intervall (0, xmax]
    for x0 = linspace(0.1, xmax, 1000)
        try
            % Finde die Nullstelle nahe x0
            xroot = fsolve(@f, x0, optimoptions('fsolve', 'Display', 'none'));

            % Überprüfe, ob die Nullstelle im Intervall liegt
            if xroot > 0 && xroot <= xmax
                % Überprüfe auf Einzigartigkeit der Nullstelle
                if isempty(find(abs(xroots - xroot) < 1e-5, 1))
                    xroots(end+1) = xroot;
                end
            end
        catch
            % Fange Fehler ab, die auftreten können
        end
    end

    % Sortiere die gefundenen Nullstellen
    xroots = sort(xroots);

    % Schöne Ausgabe der Nullstellen
    fprintf('Gefundene Nullstellen im Intervall (0, %f]:\n', xmax);
    for i = 1:length(xroots)
        fprintf('Nullstelle %d: %f\n', i, xroots(i));
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end





