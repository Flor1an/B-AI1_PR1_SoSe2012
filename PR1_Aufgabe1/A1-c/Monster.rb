require 'Point'
require 'Leinwand'
require 'Einstellungen'

class Monster
  def initialize(position, farbe)

    @körper = Rechteck.new(Point.new(0,10)+position,50,50,farbe)
    @hut = Dreieck.new(Point.new(25,0)+position,20,50,farbe)
    @auge1 = Kreis.new(Point.new(10,20)+position,5,:white)
    @auge2 = Kreis.new(Point.new(40,20)+position,5,:white)

    @sichtbar = false
  end

  def sichtbar?
    return @sichtbar
  end

  def sichtbar_machen
    @sichtbar = true
    zeichnen()
  end

  def zeichnen()
    if sichtbar?()
      #Jedes Objekt wird einzelnd gezeichnet. Da Leinwand keine Methode .zeichne_monster() hat.
      @körper.sichtbar_machen()
      @hut.sichtbar_machen()
      @auge1.sichtbar_machen()
      @auge2.sichtbar_machen()
    end
  end

  def animiere(steps, xAchse, yAchse, delay, startDelay)

    @körper.bewegen(steps, xAchse, yAchse, delay, startDelay)
    @hut.bewegen(steps, xAchse, yAchse, delay, startDelay)
    @auge1.bewegen(steps, xAchse, yAchse, delay, startDelay)
    @auge2.bewegen(steps, xAchse, yAchse, delay, startDelay)
  end

end