$CLASSES = [ :Life ]

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
   :Life => {
     :naechste_generation => { :label => :naechste_generation },
     :simuliere => {:label => :"simuliere(...)", :args => [[:schritte, :Integer]]},
     :zuruecksetzen => {:label => :zuruecksetzen}
   },  
  :Life_class => {
  :new => {:label => :'new()' , :args => [ [:'spielfeld_groesse', :Integer] , [:muster, :Integer]]}}
}

