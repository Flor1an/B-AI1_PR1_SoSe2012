require "utils/AnimierteGrafik"
require "tk"
require "Leinwand"

class RekursiverBaum
  include AnimierteGrafik
  def initialize(x=300,y=400,laenge=200)
    super()
    @x = x
    @y  = y
    @laenge = laenge
    @breite = 5
  end

  def zeichnen(wiederholungen,x=@x,y=@y,laenge = @laenge, breite = @breite,winkel=Math::PI/2)
    Leinwand.gib_einzige_instanz().radieren()
    _zeichnen(wiederholungen,x,y,laenge, breite,winkel)
    restart()
  end

  def _zeichnen(wiederholungen,x,y,laenge,breite,winkel)
    
    return if wiederholungen == -1

    x_0 = x
    y_0 = y
    
    x_1 = x + laenge
    y_1 = y + laenge
    
    breite /= 1.4
    
    
    x_ende = (x + laenge*Math.cos(winkel)).round()
    y_ende = (y - laenge*Math.sin(winkel)).round()
    
    
    zeichne_linie(x_0,y_0,x_ende,y_ende,breite)
    
    _zeichnen(wiederholungen-1,x_ende,y_ende,laenge/2,breite,winkel+1.2) #links
    _zeichnen(wiederholungen-1,x_ende,y_ende,laenge/2,breite,winkel-0.3) #rechts
    _zeichnen(wiederholungen-1,x_ende,y_ende,laenge/4,breite,winkel+0.5) #mitte
  end

  
  def zeichne_linie(x_0,y_0,x_1,y_1,breite)
    puts "linie (#{x_0},#{y_0}) (#{x_1},#{y_1}) b=#{breite}"
    animiere(10) {
      TkcLine.new( Leinwand.gib_einzige_instanz(),x_0,y_0,x_1,y_1,:fill => :black, :width => ([1,breite].max()))
    }
  end
end