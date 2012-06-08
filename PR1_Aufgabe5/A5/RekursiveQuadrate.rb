require "utils/AnimierteGrafik"
require "tk"
require "Leinwand"

class RekursiveQuadrate
  include AnimierteGrafik
  def initialize()
    super()

  end

  def zeichnen(wdhl,x,y,kl)
    loeschen()
    _zeichnen(wdhl,x,y,kl)
    restart()
  end

  def _zeichnen(wdhl,x,y,kl)

    return if wdhl == 0
    

    zeichne_quadrat(x,y,kl)
    
    
    
    kl = kl/2.2
    
    x1=x-(kl/2)
    x2=x+(kl/2)+kl
    y1=y-(kl/2)
    y2=y+(kl/2)+kl
    
    _zeichnen(wdhl-1,x1,y1,kl)
    _zeichnen(wdhl-1,x1,y2,kl)
    _zeichnen(wdhl-1,x2,y2,kl)
    _zeichnen(wdhl-1,x2,y1,kl)
    


  end

  def zeichne_quadrat(x,y,kl)
    animiere(20) {
      TkcRectangle.new(Leinwand.gib_einzige_instanz(),x,y,x+kl,y+kl,:fill => :darkgray, :outline => :black)
    }
  end

end