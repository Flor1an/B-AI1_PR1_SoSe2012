#Teil D:  Folge von Potenzen berechnen
#Schreiben Sie eine Methode, die zu einer gegebenen Zahl x und einer oberen Grenze n, eine Folge 
#von Potenzen berechnet und ausgibt solange die Potenz  <=  n ist.
#Also die Folge: x^0, x^1, .... x^k

#Denken Sie auch hier über eine effiziente Lösung nach.

#Die Methode soll das k zurückgeben für das x^k <= n ist


def folge_von_potenzen(x, n)
  k = 0
  while x**k <= n
    
    loesung = x**k
    k += 1
  end
  return "#{x} ** #{k-1} = #{loesung}"
end

print "Folge von Potenzen berechnen\nBitte die Basis eingeben: "
basis = gets.chomp
print "Bitte die obere Grenze eingeben: "
grenze = gets.chomp



puts "\nMaximale Lösung bei  #{folge_von_potenzen(Integer(basis), Integer(grenze))} um unter der Grenze von #{grenze} zu bleiben."