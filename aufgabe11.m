
function [] = aufgabe11()

[time,pos] = a11("velocity_time.csv");
check(size(time) == size(pos), "Dimension der Rückgabewerte ist falsch\n")
check(all(size(time) == [100,1]), "Dimension von time ist falsch\n")
check(all([100,1] == size(pos)), "Dimension von pos ist falsch\n")

TPeriode =  4/2;
omega = 1/TPeriode*(2*pi);
t = linspace(0,4,100);
s = sin(omega.*t)./(omega^2);
check ( all( 1e-4 > abs(t(:)- time(:)) ), ...
    "Zeitwerte entsprechen nicht den Werten aus der Datei!\n");
check ( all( 2e-4 > abs(s(:)- pos(:)) ), ...
    "Position ist nicht richtig!\n");

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

%% Aufgabe 11: Integrieren (3 Punkte)
function [time,pos] = a11(filename)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% lesen Sie die Datei "velocity_time.csv" ein.
% Verweden sie die Daten in der ersten Spalte als Zeit, die Daten aus der 
% zweiten Splate sind die Geschwindigkeit zu diesem Zeitpunkt. 
% Geben Sie die Position zu den Zeiten in dem Array t zurück.
%default initialisierung
time=0;
pos=0;
%% Ihr Code:

    % Lese die Daten aus der CSV-Datei
    data = readmatrix(filename);
    
    % Erste Spalte ist die Zeit, zweite Spalte ist die Geschwindigkeit
    time = data(:, 1);
    velocity = data(:, 2);

    % Initialisiere das Positionen-Array
    pos = zeros(size(time));

    % Berechne die Positionen durch Integration der Geschwindigkeit
    % Initialposition ist 0
    for i = 2:length(time)
        dt = time(i) - time(i - 1);
        pos(i) = pos(i - 1) + 0.5 * (velocity(i) + velocity(i - 1)) * dt;
    end


    % Ausgabe der Ergebnisse
    disp('Zeit und Positionen:');
    for i = 1:length(time)
        fprintf('Zeit: %f, Position: %f\n', time(i), pos(i));
    end

    % Definiere t für den Workspace
    t = time;
    assignin('base', 't', t);
    plot(time,pos);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
