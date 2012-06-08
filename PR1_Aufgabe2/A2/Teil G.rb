#Teil G: Prüfziffern berechne
#(In Aufgabenstellung E)
#ISBN ist ein 10-stelliger Code zur Kennzeichnung von Büchern. Die Ziffer ganz rechts ist die Prüfziffer, 
#die eindeutig aus den übrigen 9 Ziffern berechnet werden kann, aufgrund der Formel:
#d1 + 2 ∗ d2 + 3 ∗ d3 + 4 ∗ d4 + 5 ∗ d5 + 6 ∗ d6 + 7 ∗ d7 + 8 ∗ d8 + 9 ∗ d9 + 10 ∗ d10 = n ∗ 11
#In der Formel entspricht di der i‘ten Ziffer von rechts gelesen beginnend mit 1 (d1 ist die Prüfziffer).
#Schreiben Sie ein Programm, das eine 9-stellige Zeichenkette einliest und aus dieser Zeichenkette mit 
#der oben stehenden Formel die Prüfziffer berechnet und die ISBN Nummer ausgibt.


def pruefziffer_berrechnen(isbn)
  i = 1
  summe = 0
  pz = nil
  if isbn.size == 9 #&& isbn.isnumeric <- funktioniert nicht
    
    while i <= 9
      summe += i * Integer(isbn[i-1]) #1*ZIFFER1 + 2*ZIFER2 + 3*ZIFFER3 ....
      
      i += 1      
    end
    
    pz = summe%11   #summe modolo 11 ergibt die prüfziffer
    return pz
  end

end

print "Bitte 9 Stellige ISBN eingeben:"
isbn = gets.chomp

puts "Die Prüfziffer lautet: #{pruefziffer_berrechnen(isbn)}"