#Teil B: Quadratische Gleichung berechnen
#Lösung der quadratischen Gleichung:  
#Lesen die Koeffizienten a,b,c  von der Konsole (Methode gets) und berechnen Sie die Lösung der 
#quadratischen Gleichung. Bestimmen Sie ob es eine 
#reelle Lösung gibt. Geben Sie diese Information und das ggf. das Ergebnis der 
#Berechnung auf der Konsole aus.
#Wenn die Eingaben nicht korrekt sind, d.h. a,b,c  keine gültigen Zahlen sind, dann soll das Programm 
#abbrechen.



def formel_ausgeben(a,b,c)
  
  if Float(b) >= 0
    b = "+" + b     #bei positiven Zahlen ein + anzeigen
  end
  
  if Float(c) >= 0
    c = "+" + c    #bei positiven Zahlen ein + anzeigen
  end
  
  return "f(x)=#{a}x²#{b}x#{c}"
end


def berrechne(a,b,c)
  
  if (b**2)-4*a*c < 1
    return "Keine reelle Lösung"
  elsif (b**2)-4*a*c == 0
    l1 = ((-b + Math.sqrt((b**2)-4*a*c))/2*a)
    return "Eine reelle Lösung\nL=#{l1}"
  elsif (b**2)-4*a*c > 1
    l1 = ((-b + Math.sqrt((b**2)-4*a*c))/2*a)
    l2 = ((-b - Math.sqrt((b**2)-4*a*c))/2*a)
    return "Zwei reelle Lösungen\nL=#{l1} | L=#{l2}"
  end
  

end

print "Lösung der quadratischen Gleichung: f(x)=ax²+bx+c \n\nBitte Werte eingeben für\na="
a= gets.chomp
print "b="
b= gets.chomp
print "c="
c=gets.chomp

print "\nberrechne: #{formel_ausgeben(a,b,c)} \n\n"




puts berrechne(Float(a),Float(b),Float(c))
