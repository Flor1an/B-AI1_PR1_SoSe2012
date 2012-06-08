# Teil B: Darlehensentwicklung
=begin
Schreiben Sie eine Methode darlehens_entwicklung(K,j,r,t), das die Darlehensentwicklung für
  - einen Darlehensbetrag K,
  - eine Laufzeit von Jahren j,
  - einer jährlichen Zinsrate von r und
  - einer Tilgungsrate von t
in einer Tabelle einträgt.

Schreiben Sie eine Methode, die den Inhalt der Tabelle mit geeigneten Spaltennamen ausgibt.
Die Tabelle enthält für jedes Jahr und jeden Monat Einträge über den Restdarlehensbetrag,
die monatlichen Zinsen, die monatliche Tilgung, sowie die bis zu dem Monat akkumulierten Zinsen.

Der Restdarlehensbetrag ergibt sich aus der Differenz des Restdarlehensbetrags des Vormonats
und der für den Vormonat geleisteten Tilgung.

=end

def fillup(input)
  if(input.kind_of?(Float))
    input = input%2 == 0 ? input.round(0) : input.round(2)
  end
  return input.to_s + (" " * (15 - input.to_s.length) )
end

def darlehens_entwicklung(k,j,r,t)
  k = Float(k) # Darlehn
  j = Float(j) # Laufzeit
  r = Float(r) # Zinssatz
  t = Float(t) # Tilgung

  puts "-" * 15 * 6
  puts fillup("Jahr") + fillup("Monat") + fillup("Darlehn") + fillup("Zinsen") + fillup("Tilgungn") + fillup("Zinsen/gesamt")
  puts "-" * 15 * 6
  
  for j in 1..j
    for m in 1..12
      jahr = j
      monat = m
      darlehn = (darlehn ? darlehn : k)
      zinsen = (darlehn / 100 * (r / 12)).round(2)
      zGesamt = (zGesamt ? zGesamt + zinsen : zinsen).round(2)
      tilgung = (t - zinsen) / 12

      puts "#{fillup(jahr)}#{fillup(monat)}#{fillup(darlehn)}#{fillup(zinsen)}#{fillup(tilgung)}#{fillup(zGesamt)}"

      darlehn = darlehn - tilgung

      if(darlehn < 0)
        break
      end
    end
  end
  puts "-" * 15 * 6

  puts fillup("") + fillup("") + fillup(darlehn) + fillup("") + fillup(tilgung * 12 * j) + fillup(zGesamt)
end

darlehens_entwicklung(1000, 3, 5, 100)