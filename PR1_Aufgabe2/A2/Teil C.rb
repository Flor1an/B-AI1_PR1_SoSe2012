#Teil C: Approximation der Exponentialfunktion mit Fehlerbestimmung
#Schreiben Sie eine Methode für die nachfolgende Näherungsformel der Exponentialfunktion:
#######
#######
#######
#######
#Schreiben Sie auch eine Methode zur Berechnung der Fakultät.
#Bewerten Sie Ihre Lösung: Wie effizient ist diese? Werden Berechnungen mehrfach durchgeführt?
#Wenn ja, beseitigen Sie Mehrfachberechnungen. 
#Schreiben Sie eine Methode, die die Anzahl der Schritte bestimmt, bis die Näherungsformel von dem 
#Wert  e^x kleiner einem vorgegebenen Fehler abweicht. Die Methode hat zwei Parameter, das x und 
#den Wert für den zulässigen Fehler.  Die Methode gibt  die Anzahl der Schritte zurück. Zur 
#Berechnung des Wertes e^x in Ruby verwenden Sie die Methode exp im Modul Math.


def fakultaet_berrechnen(i)
  schritt = 0
  produkt = 1
  
  i.times do
   
    schritt += 1
    produkt *= schritt
  end
  
  return  produkt
end


def zulaessige_fehler(x,fehler)
  # TODO: Aufgabe verstehen / Anzahl der Fehler ausgeben ?!
  return (x**i)/fakultaet_berrechnen(i)
end

puts fakultaet_berrechnen(3)


puts Math.exp(3)
