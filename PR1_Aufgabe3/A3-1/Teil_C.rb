#Teil C Binomialkoeffizienten berechnen
#Sie sollen für ein N, das Sie von der Konsole einlesen die Binomialkoeffizienten berechnen 
#und diese in einem zweidimensionalen ungleichförmigen Array a speichern, 
#so dass a[N][k] die Wahrscheinlichkeit enthält, dass Sie genau k –mal Kopf erhalten, 
#wenn Sie eine Münze N mal werfen.
#Die Berechnungsvorschrift, die sich aus dem Pascalschen Dreieck ableitet, lautet:
#a[k][0] = 0, für alle k
#a[N][k+1] = 0, für alle N, alle k
#a[1][1] = 1
#a[N][k] = (a[N-1][k] + a[N-1][k-1]) /2
#Schreiben Sie dazu die Methode binomial_koeffizienten(n), die das Array erzeugt, 
#sowie eine Methode zwei_dim_ary_ausgeben(zwei_dim_ary), die das Ergebnis auf der 
#Konsole ohne die 0’te Spalte und das jeweils letzte Element einer Zeile, das (k+1)‘te Element ausgibt.
#Für N = 5 sieht die Ausgabe wie folgt aus:
#1
#0.5 0.5
#0.25 0.5 0.25
#0.125 0.375 0.375 0.125
#0.0625 0.25 0.375 0.25 0.0625


def binomial_koeffizienten(n)

  pasDreiArray = []

  for i in (0..n)
    pasDreiArray[i] = []

    if i == 0
      pasDreiArray[i] << 0
    elsif i == 1
      pasDreiArray[i] << 1
    else
      for k in (0...i)
        pasDreiArray[i] << (pasDreiArray[i-1][k] + pasDreiArray[i-1][k-1]) / 2.0
      end
    end

    pasDreiArray[i] << 0
  end

  return pasDreiArray
end

def zwei_dim_ary_ausgeben(n)
  n = Integer(n)
  pasDreiArray = binomial_koeffizienten(n)

  pasDreiArray.each_index{|index|
    pasDreiArray[index].delete(0)
  }

  pasDreiArray.each{|subary|
    subary.each{|elem|
      print "#{elem} "
    }
    puts
  }

end

print "Zu berechnenden Binomialkoeffizienten eingeben \nn:"
n =  gets.chomp

zwei_dim_ary_ausgeben(n)