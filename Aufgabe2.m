%% Aufgaben Block 2
%% Test code: 
function [] = Aufgabe2()
% Test funktion für Aufgabe 3 und Aufgabe 4:


fig=a3();
ax = findall(fig,'type','axes');
check(~isempty(ax) , " there are no axis in the figure\n")
if (~isempty(ax))
    check(ax.LineWidth == 4, "ax.LineWidth ~= 4\n")
    check(ax.XTick(1) == 0,  "ax.XTick(1) ~= 0\n" )
    check(ax.XTick(end) == 1, "ax.XTick(end) ~= 1\n" )
    check(ax.YTick(1) == -1, "ax.YTick(1) ~= -1\n" )
    check(ax.YTick(end) == 1, "ax.YTick(end) ~= 1" )

    line = findall(fig,'type','line');
    check(length(line) == 2, "length(line) ~= 2")
end

fib_1n= a4();
check(length(fib_1n) == 5 , "nicht die ersten n Fibonacci Zahlen berechnet")
for i = 3:length(fib_1n)
    check(fib_1n(i) == fib_1n(i-2) +fib_1n(i-1), sprintf("Fiboinacci Zahl %d ist falsch! ", i ))
end

end


function check(eval_bool, msg)
if (~eval_bool)
    fprintf("ERROR: ")
    fprintf(msg)
    fprintf('\n')
end
end


%% Aufgabe 3 : Plotten (5 Punkte)
% Erstellen Sie einen Plot der so aussieht wie die Abbildung unter:
% https://moodle.htwg-konstanz.de/moodle/mod/resource/view.php?id=59086
% Geben Sie das Plot-Objekt in der Variable plt zurück.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [fig] = a3()
    fig = figure;
    x = linspace(0,1,50);
    y0 = sin(pi*x);
    y1 = cos(pi*x);
% Ihr Code:
    h0 = plot(x, y0, 'b', 'LineWidth', 2); %blau
    hold on;
    % Ändere die Markereigenschaften
    h0.Marker = 's';
    h0.MarkerIndices = 1:5:length(x); % Setzt den Marker alle 10 Punkte
    h0.MarkerEdgeColor = 'k';
    h0.MarkerFaceColor = 'r';

    h1 = plot(x, y1, 'Color', [1, 0.5, 0], 'LineWidth', 2); % rote linie
    h1.Marker = 'x';
    h1.MarkerIndices = 1:5:length(x);
    h1.MarkerEdgeColor = 'k';

    % Achseneigenschaften
    ax = gca;
    ax.LineWidth = 4;
    ax.XTick = [0, 0.2, 0.4, 0.6, 0.8, 1];
    ax.YTick = [-1, -0.5, 0, 0.5, 1];
    ax.FontSize = 12;
    ax.FontName = 'Arial';

    xlabel("X", 'FontSize', 20, 'FontName', 'Cambria Math');
    ylabel("sin(pi * x), cos(pi * x)", 'FontSize', 20, 'FontName', 'Cambria Math');
    legend("Sinus","Cosinus",'Location',"southwest");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

%% Aufgabe 4 : Fibonacci-Zahlen (5 Punkte)
% Schreiben Sie die Funktion fib(n) die die ersten n Fibonacci-Zahlen
% berechnet und in einem array zurückgibt.
function [ret] = a4()
    
if (exist('fib') == 2)
    ret = fib (5);
else
    ret = 0;
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ihr Code:
function [fib_numbers] = fib(n)
    if n < 1
        fib_numbers = [];
        return;
    elseif n == 1
        fib_numbers = [0];
        return;
    end

    fib_numbers = zeros(1, n);
    fib_numbers(1) = 0;
    fib_numbers(2) = 1;
    for i = 3:n
        fib_numbers(i) = fib_numbers(i-1) + fib_numbers(i-2);
    end
    assignin('base', 'fib_zahlenJ', fib_numbers);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%