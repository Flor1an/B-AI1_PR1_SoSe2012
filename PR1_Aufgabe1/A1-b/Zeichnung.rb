require 'tk'
require 'Rechteck'
require 'Kreis'
require 'Dreieck'
require 'Einstellungen'

class Zeichnung
     
  def initialize()
    # Wir benutzen die geometrischen Figuren, um ein Haus zu konstruieren
    @wand = Rechteck.new(Point.new(52,150),100,100,:red)
    @dach = Dreieck.new(Point.new(100,130),40,120,:blue)
    @fenster = Rechteck.new(Point.new(70,170),20,20,:green)
    @sonne = Kreis.new(Point.new(300,20),50,:yellow)
    @horizont = Rechteck.new(Point.new(0,250),500,200,:white)
    # Das Szenario spielt sich am Tag ab, die Sonne scheint
    @sichtbar = false
  
    
  end
  
  
  def zeichne()
    @wand.sichtbar_machen()
    @dach.sichtbar_machen()
    @fenster.sichtbar_machen()
    @sonne.sichtbar_machen()
    @horizont.sichtbar_machen()

    
  end
  
  
  def in_schwarz_weiss_aendern()

   
    @wand.farbe_aendern("schwarz")
    @dach.farbe_aendern("schwarz")
    @fenster.farbe_aendern("weiss")
    @sonne.farbe_aendern("schwarz")
    Leinwand.gib_einzige_instanz().erneut_zeichnen()
    
      
  end
  
  def in_farbe_aendern()
    @wand.farbe_aendern("rot")
    @dach.farbe_aendern("blau")
    @fenster.farbe_aendern("gruen")
    @sonne.farbe_aendern("gelb")
    Leinwand.gib_einzige_instanz().erneut_zeichnen()
  end
  
  def sonnenuntergang()
    @sonne.bewegen(30,5,10,5,0)
    
    in_schwarz_weiss_aendern()
   

  
  end
end