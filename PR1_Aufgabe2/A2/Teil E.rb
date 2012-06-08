#Teil E: Farbumwandlung
#Für Farbdarstellungen sind unterschiedliche Formate bekannt. Das RGB Format  für Bildschirme, 
#Digitalkameras etc., das CMYK Format für den Druck von Büchern etc.  
#RGB kodiert Farbanteile in Rot (R), Grün (G) und Blau (B) Werten in Bereich von 0-255. 
#CMYK kodiert Farbanteile in Cyan (C), Magenta (M), Yellow (Y) und Black (K) Werten auf einer reellen Skala von 0.0-1.0.
#Schreiben Sie eine Methode, die RGB-Werte in CMYK Werte umwandelt.  Sind alle RGB Werte 0, 
#dann sollen die CMY Werte 0.0 sein und der K Wert 1. Ansonsten verwenden Sie die folgenden 
#Formeln zur Berechnung des Farbwertes:
#
#   w = max ((r/255), (g/255), (b/255))
#   c = (w − (r/255))/w
#   m = (w − (g/255))/w
#   y = (w − b/255)/w
#   k = 1 − w


def rgb_in_cmyk(r,g,b)
  r = Float(r)    #
  g = Float(g)    # Integer werte direkt in Float umwandeln für genauere Ergebnisse!
  b = Float(b)    #
  
  c=0.0
  m=0.0
  y=0.0
  k=0.0


  if r > 255 || g > 255 || b > 255
    return "FEHLER: Die RGB Werte dürfen nicht über 255 sein!" 
    
  elsif r == 255 && g == 255 && b == 255
    c=0
    m=0
    y=0
    k=0
  elsif  r == 0 && g == 0 && b == 0
    c=0
    m=0
    y=0
    k=1.0
  else
    w = [(Float(r)/255), (Float(g)/255), (Float(b)/255)].max
    c = (w - (r/255)) / w
    m = (w - (g/255)) / w
    y = (w - (b/255)) / w  
    k = 1 - w
  end
  
  return "#{c.round(3)} | #{m.round(3)} | #{y.round(3)} | #{k.round(3)}"
  
end

print "RGB -> CMYK Umwandeln\n\nBitte Wert für rot eingeben: "
r = gets.chomp
print "Bitte Wert für grün eingeben: "
g = gets.chomp
print "Bitte Wert für blau eingeben: "
b = gets.chomp

puts "\n\n"


print "RGB: #{r} | #{g} | #{b} \nCMYK: #{rgb_in_cmyk(r,g,b)}"

