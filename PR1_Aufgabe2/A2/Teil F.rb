#Teil F: Wochentag berechnen
#(In Aufgabenstellung E)
#Schreiben Sie eine Methode die aus Monat (m), Tag (d) und Jahr (y) den Wochentag (d0) berechnet. 
#Übergeben Sie 1 für Januar, 2 für Februar etc., 0 für Sontag, 1 für Montag etc. Verwenden Sie die
#folgenden Formeln des gregorianischen Kalenders zur Berechnung

def wochentag_berrechnen(d, m, y)
d = Integer(d)
m = Integer(m)
y = Integer(y)
  
# TODO: Richtigen Wochentag ausgeben!
  y0 = y - (14-m)/12
  x = y0 - (y0/4)-(y0/100)+(y0/400)
  m0 = m + 12 * (14-m)/12 - 2
  d0 = (d + x + 31 * m0/12)%7
  
return  case d0
  when 0 then "Sonntag"
  when 1 then "Montag"
  when 2 then "Dienstag"
  when 3 then "Mittwoch"
  when 4 then "Donnerstag"
  when 5 then "Freitag"
  when 6 then "Samstag"
  end
  
  
end
print "Bitte ein Datum eingeben:\nTag: "
d = gets.chomp
print "Monat: "
m = gets.chomp
print "Jahr: "
y = gets.chomp


puts wochentag_berrechnen(d, m, y)