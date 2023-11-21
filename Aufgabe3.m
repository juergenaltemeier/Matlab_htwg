%%EX3 test code für die Übungsaufgaben.
%% Aufgaben Block 3 für 14.11.2023 ->  Abgabe bis 28.11.2023
% Test code: 
function [] = Aufgabe3()
x=sym('x');
ret5 = a5(x);
Km=ret5;
K=[0 1 1 ; -2 1 0 ; x 0 0 ];
id_check = K*Km;
check(all(id_check == eye(3)), "links inverse Matrix ist falsch");
id_check = Km*K;
check(all(id_check == eye(3)), "rechts inverse Matrix ist falsch");

N=10;
[freq, v, M] =a6(N);

check(all(size(freq(:)) == [2 1]), "Zahl der frequenzen ist falsch." )
check(all(size(v) == [N 2 ]), "Größe der Eigenvektoren ist falsch." )
check(all(size(M) == [N N ]), "Größe der Matrix ist falsch." )

for i =1:2
    test_scalar= abs(sum(M*v(:,i) / (freq(i))^2 - v(:,i)));
    check(all(size(test_scalar) == [1 1]) ,...
        "Dimensionen der rückgabewerte ist faalsch.")
    check(test_scalar < 1e-10*N, ...
        sprintf('check für freq %d fehlgeschlagen!',i))
end
%fprintf("freq min: %f  freq max: %f\n", freq)
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


%% Aufgabe 5: Mathe mit Matlab (3 Punkte)
% Lösen Sie Aufgabe 3-5 aus dem Mathematik Übungsblatt mit Matlab.
% Berechnen Sie die inverse Matrix und geben Sie diese in Km zurück.
% Sie erhalten \alpha als Argument x.
function [Km] = a5(x)
Km = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ihr Code:
K = [0 1 1; -2 1 0; x 0 0];
Km = inv(K);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

%% Aufgabe 6: Brückenmodell (5 Punkte)
% Schreiben Sie ein Programm, das das Beispiel aus der Vorlesung mit der
% Brücke aufgreift. Verlängern Sie die Brücke von 2 Brückenelementen auf 
% n Brückenele.
% Geben Sie die kleinste und größte Schwingungsfrequenz zurück und den
% zugehörigen Eigenvektor (die zugehörige Eigenmode) und die Matrix, die
% Sie erzeugt haben um das Problem zu beschreiben.
% Die Paramter sind k=1 und m=1.
function [frequenz, Vektor, M] = a6(n)
frequenz=[0 0];
Vektor=[0 0];
M=zeros(n);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ihr Code:
    % Federkonstante k und Masse m sind gegeben als 1
    k = 1;
    m = 1;

    % Erstelle die Steifigkeitsmatrix K für eine Brücke mit n Brückenelementen
    K = zeros(n); % Initialisiere die Steifigkeitsmatrix mit Nullen
    for i = 1:n
        K(i, i) = 2 * k; % Hauptdiagonale auf 2k setzen
        if i < n
            K(i, i+1) = -k; % Nebendiagonale auf -k setzen
            K(i+1, i) = -k; % Nebendiagonale auf -k setzen
        end
    end

    % Berechne die Eigenwerte und Eigenvektoren der Steifigkeitsmatrix K
    [V, D] = eig(K);

    % Extrahiere die Eigenwerte
    eigenvalues = diag(D);
    [sortedValues, sortIndex] = sort(eigenvalues);

    % Berechne die frequenzen
    frequenz = sqrt(sortedValues / m);

    % Nimm den kleinsten und den größten Wert als frequenzen
    frequenz = [frequenz(1), frequenz(end)];

    % Ordnen
    Vektor = V(:, sortIndex);
    Vektor = [Vektor(:, 1), Vektor(:, end)]; % Nehme nur die zu den extremen frequenzen gehörenden Eigenvektoren

    % Die Matrix M, die das Problem beschreibt, ist die Steifigkeitsmatrix K
    M = K;


    % Ausgabe der frequenzen
fprintf('Die kleinste Schwingungsfrequenz ist: %f\n', frequenz(1));
fprintf('Die größte Schwingungsfrequenz ist: %f\n', frequenz(2));

% Ausgabe der zugehörigen Eigenvektoren
fprintf('Eigenvektor der kleinsten Schwingungsfrequenz:\n');
disp(Vektor(:, 1));

fprintf('Eigenvektor der größten Schwingungsfrequenz:\n');
disp(Vektor(:, 2));

% Ausgabe der Matrix M
fprintf('Matrix M, die das Problem beschreibt:\n');
disp(M);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end