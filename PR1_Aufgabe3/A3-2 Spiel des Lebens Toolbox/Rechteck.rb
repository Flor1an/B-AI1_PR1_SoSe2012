require 'Point'
require 'Leinwand'
require 'Einstellungen'

class Rechteck
  
  # initialize wird aufgerufen, wenn Instanzen der Klasse erzeugt werden
  # @xxxx sind die Instanzvariablen der Instanzen
  def initialize(pos,breite,hoehe,farbe,ist_gefuellt=true)
     
      # Alle Rechtecke haben zu Beginn ihre obere linke Ecke im Punkt 100,100
      # breite und laenge sind 30
      @obere_linke_ecke = pos
      @breite = breite
      @hoehe = hoehe
      
      # und die Farbe ist blau
      @farbe = farbe
      if (ist_gefuellt)
        @fuell_farbe = @farbe
      else
        @fuell_farbe = :white
      end
      # und sind unsichtbar
      @sichtbar = false
  end
  
  def sichtbar?
    return @sichtbar
  end
 
  def obere_linke_ecke
    return @obere_linke_ecke
  end
  
  def hoehe
      return @hoehe    
  end
  
  def breite
    return @breite
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
    # Obere rechte Ecke um 10 Pixel nach unten verschieben
    bewegen_um_punkt(Point.new(0,10))
  end
  
  def horizontal_bewegen(anzahl)
    # Obere rechte Ecke um Anzahl Pixel horizontal verschieben
    bewegen_um_punkt(Point.new(anzahl,0))
  end
  
  def vertikal_bewegen(anzahl)
    # Obere rechte Ecke um Anzahl Pixel vertikal verschieben
    bewegen_um_punkt(Point.new(0,anzahl))
  end  
  
  # Bewegt das Rechteck langsam vertikal um 
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
    @obere_linke_ecke = @obere_linke_ecke + Point.new(0,entfernung)
  end

  def farbe 
    return @farbe
  end
  
  def fuell_farbe
    return @fuell_farbe
  end
  
  def farbe_aendern(neue_farbe,ist_gefuellt)
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
      if ist_gefuellt
        @fuell_farbe = @farbe
      else
        @fuell_farbe = :white
      end
      if (sichtbar?)
          Leinwand.gib_einzige_instanz().farbe_aendern(self)   
      end    
  end
  
  def groesse_aendern(neue_breite,neue_hoehe=neue_breite)
    loeschen()
    @breite = neue_breite
    @hoehe =  neue_hoehe
    zeichnen()
  end
   
  # Methode für das Verschieben eines Rechtecks 
  def bewegen_um_punkt(punkt)  
    @obere_linke_ecke = @obere_linke_ecke + punkt
    if (sichtbar?)
      Leinwand.gib_einzige_instanz().verschiebe(self,punkt.x,punkt.y)      
    end
  end
   
  # Methoden nutzen die der Rechteckinstanz bekannte Leinwand, um das Rechteck darzustellen
  def zeichnen()
    if (sichtbar?)
      Leinwand.gib_einzige_instanz().zeichne_rechteck(self)        
    end
  end
  
  def loeschen()
    if (sichtbar?)
      Leinwand.gib_einzige_instanz().loesche(self)
    end
  end
  
end