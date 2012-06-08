require 'tk'
require 'Rechteck'
require 'Kreis'
require 'Dreieck'
require 'Einstellungen'
require 'Monster'

class KreaturenParcour
      
  def initialize()
  

    farbe = case Integer(rand(1..5))
    when 1 then :red
    when 2 then :blue
    when 3 then :yellow
    when 4 then :black
    else :green
    end
    
    # Hier wird die fest definierte Kreatur erzeugt(in Monster.rb)  
    @monster= Monster.new(Point.new(rand(500),rand(500)),farbe)    
    @monster2= Monster.new(Point.new(rand(500),rand(500)),farbe)

    zeichne()
  end
  

  def zeichne()
    #   #Zeichne (sichtbar machen) der Kreaturen
    @monster.sichtbar_machen()
    @monster2.sichtbar_machen()
  end
  
  def animieren()

    #1. Bewegung der fest definierte Kreatur
    #steps, xAchse, yAchse, delay, startDelay
    #@monster.animiere(100,1,0,50,0)
    delay1 = rand(200)
    @monster.animiere(rand(200),rand(-5..5),rand(-5..5),rand(100),delay1)
    @monster2.animiere(rand(200),rand(-5..5),rand(-5..5),rand(100),delay1)
    #2. Bewegung der fest definierte Kreatur
    # @monster.animiere(100,-1,1,50,100*50)
    @monster.animiere(rand(200),rand(-5..5),rand(-5..5),rand(100),delay1 * 100 + rand(200))
    @monster2.animiere(rand(200),rand(-5..5),rand(-5..5),rand(100),delay1 * 100 + rand(200))
  end
     
end

