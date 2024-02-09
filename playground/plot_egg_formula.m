close all

# Gänginge Eigrößen
# Größe	Gewicht	Durchmesser	Länge
# S	unter 53 g	 unter 41 mm	unter 57 mm
# M	53 - 63 g	41 - 43 mm	57 - 60 mm
# L	63 - 73 g	43 - 46 mm	60 - 63 mm
# XL	73 - 90 g	46 - 49 mm	63 - 68 mm

# http://www.mathematische-basteleien.de/eilinien.htm

#Elemente der Mathematik 3 (1948), Seite 67/68
#ezplot (@(x,y) 9 * x.^2 + 16 * y.^2 + 2 * x.*y.^2+y.^2-144)

# von x²/9+y²/4=1 zu x²/9+y²/4*t(x) = 1
# mit t(x) = 1 + 0.2*x
ezplot (@(x,y) x.^2/9 + y.^2/4 .* (1 + 0.15 * x) - 1)
axis equal

if 0
  ei = struct ("id", {"S", "M", "L", "XL"},
		"Gewicht_g", {[NA 53], [53 63], [63 73], [73 90]},
		"Durchmesser_mm", {[NA 41], [41 43], [43 46], [46 49]},
		"Laenge_mm", {[NA 57], [57 60], [60 63], [63 68]});


  pkg load symbolic
  syms x y

  tmp = solve(x.^2/9 + y.^2/4 .* (1 + 0.15 * x) - 1, y)
  f = function_handle (tmp(2))
  x = linspace (-3, 3, 500);
  y = f(x);

  # Ei auswählen
  id = 2;

  # skalieren
  x *= mean (ei(id).Laenge_mm) / (max (x) - min (x));
  y *= mean (ei(id).Durchmesser_mm) / 2 / max (y);

  plot(x, y)

  axis equal
endif
