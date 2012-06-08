#Teil A: Divisionsmuster ausgeben
#Gegeben eine Zahl n und zwei Zählvariablen i, j, die von 1 bis n hochzählen. Schreiben Sie eine 
#Methode, die * ausgibt, wenn i durch j oder j durch i ohne Rest teilbar ist, ansonsten Leerzeichen.
#Am Ende jeder Zeile soll die Zeilennummer ausgegeben werden. 
#Ausgaben ohne Zeilenumbruch erzeugen Sie in Ruby mit der Methode print



def mod(zahl1,zahl2)

  if zahl1%zahl2 == 0     #i ist durch j mit rest 0 teilbar
    return "* "
  elsif zahl2%zahl1 == 0  #j ist durch i mit rest 0 teilbar
    return "* "
  else                    #rest beim teilen
    return "  "
  end
end


def divisionsmuster_ausgeben(n)
  
  i = 1
  j = 1


  while i <= n
  
    while j <= n
  
      print mod(i,j)
      
      j += 1
  
    end
    puts i                  #nachdem j n-mal Durchlaufen wurde wird die Anzahl des Durchlaufes angezeigt.
    
    j=1                     # j wird wieder auf den startwert gesetzt, damit es nocheinmal n-mal Durchlaufen werden kann.        
    i += 1
    
    
  end
end



puts "Bitte eine Zahl für das Divisionsmuster eingeben:"
divisionsmuster_ausgeben(Integer(gets.chomp))