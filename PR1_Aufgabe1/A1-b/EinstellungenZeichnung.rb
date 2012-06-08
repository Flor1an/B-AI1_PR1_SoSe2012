$CLASSES = [ :Zeichnung, :Rechteck,:Dreieck,:Kreis ]

# DAS IST EIN GANZ UEBLER HACK, 
# Hier wird der Tatsache Tribut gezollt, dass es in Ruby keinen Zugriff
# auf den Parsetree gibt und es keine cleveren Verfahren gibt, um den Typ 
# von Objekten aus dem Quelltext abzuleiten

# NICHT BEACHTET WIRD HIER u.A. 
# Vererbung von Methoden
# Methoden mit variablen Argumentlisten
# Methoden mit Parameter Defaults 
# um nur einiges zu nennen

$METHOD_CONFIG = {
   :Zeichnung => {
   :zeichne => { :label => :zeichne },
   :in_schwarz_weiss_aendern => { :label => :in_schwarz_weiss_aendern },
   :in_farbe_aendern => { :label => :in_farbe_aendern},
   :sonnenuntergang => {:label => :sonnenuntergang}
   },   
   :Zeichnung_class => {
     :new => { :label => :'new()' },
     }
}