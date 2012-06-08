#Teil H:  Würfeln
#(In Aufgabenstellung G)
#Schreiben Sie eine Methode, das 3 unterschiedliche Zahlen im Intervall  [1,6] berechnet und diese 
#Zahlen ausgibt. Merken Sie sich in Variablen, v1-v6, wie häufig die einzelnen Zahlen gewürfelt wurden.
#Schreiben Sie eine Methode, die das Würfeln einer Zahl simuliert. Die Methode gibt die Anzahl der 
#Versuche zurück, bis die gesuchte Zahl gewürfelt wurde. 
#Schreiben Sie eine Methode, die das simulierte Würfeln einer Zahl n-mal wiederholt und am Ende die 
#durchschnittliche Anzahl der Treffer zurückgibt. 
#Wie verhalten sich die Methoden, wenn  diese mehrfach aufgerufen werden? Lässt sich dieses 
#Verhalten ändern? Wenn ja, wie?


def drei_wuerfeln
  v1=0
  v2=0
  v3=0
  v4=0
  v5=0
  v6=0


  
  
  3.times do
    case rand(1..6)
    when 1 then v1 +=1
    when 2 then v2 +=1
    when 3 then v3 +=1
    when 4 then v4 +=1
    when 5 then v5 +=1
    when 6 then v6 +=1
      
    end
  end
  
  return "Folgende Zahlen wurden gewürfelt: \n1=#{v1}mal \n2=#{v2}mal \n3=#{v3}mal \n4=#{v4}mal \n5=#{v5}mal \n6=#{v6}mal \n\n"


end


def wuerfeln(gewuenschte_auge,durchgaenge)


  durchschnitt = Array.new()
  
  Integer(durchgaenge).times do
    i=0
    gewuerfelte_augen = 0
    while gewuerfelte_augen != Integer(gewuenschte_auge) # solange die gewürfelten nicht genau der gewünschten getroffen wird wird weiter gewürfelt
      gewuerfelte_augen = rand(1..6)                     # und der zähler hochgezählt um die versuche zu dokumentieren
      i += 1
    end
    durchschnitt << i
    
  end
  return durchschnitt.inject(:+).to_f / durchschnitt.size
end


puts drei_wuerfeln

print "Bitte gewünschte Augen eingeben: "
gesuchte_augen = gets.chomp
print "Bitte die Anzahl der Durchgänge angeben um den Durchschnittsert zu errechnen:"
durchgaenge = gets.chomp


#puts "\n\nEs wurden #{wuerfeln(gesuchte_augen)} Versuche gebraucht um eine #{gesuchte_augen} zu erwürfeln."
puts "\n\nBei #{durchgaenge} durchgängen wurden Durchschnittlich #{wuerfeln(gesuchte_augen,durchgaenge)} Versuche gebraucht um eine #{gesuchte_augen} zu erwürfeln."