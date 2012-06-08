$CLASSES = [ :RekursiverBaum,:RekursiveQuadrate]

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
  :RekursiverBaum => {
  :zeichnen => {:label => ":zeichnen(...)", 
    :args => [[:wdhlg,:Integer],[:x,:Integer],[:y,:Integer]] },
    :loeschen => {:label => ":loeschen()"}    
  },
  :RekursiveQuadrate => {
  :zeichnen => {:label => ":zeichnen(...)", 
    :args => [[:wdhlg,:Integer],[:x,:Integer],[:y,:Integer],[:kl,:Integer]] },
    :loeschen => {:label => ":loeschen()"}    
  },
  :RekursiverBaum_class => { :new => { :label => :'new()'}},   
  :RekursiveQuadrate_class => { :new => { :label => :'new()'}}   
}