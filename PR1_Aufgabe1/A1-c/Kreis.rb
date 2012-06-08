require 'Point'
require 'Leinwand'
require 'Einstellungen'

class Kreis
 
  # initialize wird aufgerufen, wenn Instanzen der Klasse erzeugt werden
  # @xxxx sind die Instanzvariablen der Instanzen
#  def initialize()
#      # Alle Kreise haben ihren Mittelpunkt zu Beginn im Punkt 100,100
#      @mittelpunkt= Point.new(20,60); 
#      # und einen Radius von 40
#      @radius = 15  
#      
#      # Diese Eigenschaften brauchen wir für die Darstellung
#      # die Füllfarbe und Linienfarbe ist rot
#      @farbe = 'red'
#      # zu Beginn sind Kreise nicht gezeichnet
#      @sichtbar = false
#  end
  
  def initialize(mittelpunkt,radius,farbe)
      # Alle Kreise haben ihren Mittelpunkt zu Beginn im Punkt 100,100
      @mittelpunkt= mittelpunkt 
      # und einen Radius von 40
      @radius = radius  
      
      # Diese Eigenschaften brauchen wir für die Darstellung
      # die Füllfarbe und Linienfarbe ist rot
      @farbe = farbe
      # zu Beginn sind Kreise nicht gezeichnet
      @sichtbar = false
  end
 
  def mittelpunkt
    return @mittelpunkt
  end  
  
  def radius
    return @radius
  end
  
  def farbe
      return @farbe    
  end
  
  def sichtbar?()
    return @sichtbar
  end
  
  def sichtbar_machen()
      @sichtbar = true
      zeichnen()       
  end

  def unsichtbar_machen()
    loeschen() 
    @sichtbar = false
  end
  
  def nach_unten_bewegen()
    # Mittelpunkt um 10 Pixel nach unten verschieben
    bewegen_um_punkt(Point.new(0,10))      
  end
 
  def horizontal_bewegen(anzahl)
    # Mittelpukt um anzahl Pixel horizontal verschieben
    bewegen_um_punkt(Point.new(anzahl,0))
  end
  

  def vertikal_bewegen(anzahl)
     bewegen_um_punkt(Point.new(0,anzahl))
  end  
  
  # Bewege einen Kreis langsam vertikal um 
  # entfernung Bildpunkte   
  def langsam_vertikal_bewegen(entfernung)
      absolute_entfernung = entfernung
      if( sichtbar?) 
        delta  = 1
        if entfernung < 0 
          delta = -1
          absolute_entfernung = - entfernung
        end  
        x_delta = 0
        y_delta = delta
        Leinwand.gib_einzige_instanz().
              bewege(self,absolute_entfernung,x_delta,y_delta)
      end 
      @mittelpunkt = @mittelpunkt + Point.new(0,entfernung)
  end
    
  
  # bewegen
    def bewegen(wiederholungen, x_delta, y_delta, wiederholen_nach, starten_nach)
      Leinwand.gib_einzige_instanz().bewege(self, wiederholungen, x_delta, y_delta, wiederholen_nach, starten_nach)
      x_ziel_delta = x_delta * wiederholungen
      y_ziel_delta = y_delta * wiederholungen
      @mittelpunkt = @mittelpunkt + Point.new(x_ziel_delta, y_ziel_delta)
    end
  
  def farbe_aendern(neue_farbe)
      if  neue_farbe == "gruen"
        @farbe = :green
      end
      if neue_farbe == "rot" 
        @farbe = :red
      end
      if  neue_farbe == "blau"
        @farbe = :blue
      end
      if neue_farbe == "gelb"
        @farbe = :yellow
      end
      if neue_farbe == "weiss"
        @farbe = :white
      end
      if neue_farbe == "schwarz"
        @farbe = :black
      end
      if (sichtbar?)
          Leinwand.gib_einzige_instanz().farbe_aendern(self)   
      end    
  end

  
  def groesse_aendern(neuer_radius)
    loeschen()
    @radius = neuer_radius
    zeichnen()
  end
   
  # Methode für das Verschieben eines Kreis 
  def bewegen_um_punkt(punkt)  
    @mittelpunkt = @mittelpunkt + punkt
    if (sichtbar?)
      Leinwand.gib_einzige_instanz().verschiebe(self,punkt.x,punkt.y)      
    end
  end
     
  # Ein Kreis wird nur gezeichnet, wenn die Instanz sichtbar ist
  def zeichnen()
    if sichtbar?() 
      Leinwand.gib_einzige_instanz().zeichne_kreis(self)
    end
  end
  
  # Nur sichtbare Kreise werden auf der Leinwand gelöscht
  def loeschen()
    if sichtbar? 
      Leinwand.gib_einzige_instanz().loesche(self)        
    end
  end
  
end