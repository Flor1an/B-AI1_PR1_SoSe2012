require 'rechteck'

class Life
  @@muster = []
  @@muster[0] = [[1,2],[2,3],[3,1],[3,2],[3,3]]

  # weitere Muster unter http://de.wikipedia.org/wiki/Conways_Spiel_des_Lebens

  def initialize(n,muster_index)
    @generation = []
    @matrix = []

    @size = Integer(n) #Spielfeld Größe => Matrix größe

    @constAlive = Zelle.new(true,nil,nil)

    rownumber = 0
    columnnumber = 0

    #komplett tote Matrix wird erstellt
    n.times{|i|
      columnnumber+=1
      row = []

      n.times{|i|
        rownumber +=1
        row <<  Zelle.new(false,rownumber,columnnumber)#(dead)
      }
      rownumber = 0
      @matrix << row
    }

    #Tote Zellen werden mit lebenden ersetzt.
    (@@muster[muster_index] || @@muster[0]).each{|e|
      cellToAwake = @matrix[ e[0] ][ e[1] ]
      cellToAwake.wechseln()                      #Ändert den Status von tot zu lebendig
      @matrix[ e[0] ][ e[1] ] = cellToAwake #(alive)
    }

    @generation << @matrix
    #zum zurücksetzen
    @backupMatrix =  Marshal.load( Marshal.dump(@matrix) ) #um das eigentliche start objekt zu benutzen
  end

  def naechste_generation()
    awake = []
    asleep = []

    @matrix.each_with_index{|rowElm, rowInx|
      rowElm.each_with_index{|colElm, colInx|

        key = [rowInx, colInx]

        alive = lebende_nachbar_zellen(rowInx, colInx)

        # from dead to alive if three neighbours are alive
        if alive.length == 3
          awake << key
        end

        # from alive to dead if one neighbour is alive
        if alive.length == 1
          asleep << key
        end

        # from alive to dead if more then three neighbours are alive
        if  alive.length > 3
          asleep << key
        end

      }
    }

    # redefine matrix

    awake.each{|e|
      tempAlive = Zelle.new(true,@matrix[ e[0] ][ e[1] ].row,@matrix[ e[0] ][ e[1] ].column)

      @matrix[ e[0] ][ e[1] ]  = tempAlive
    }
    
    
    asleep.each{|e|
      tempDead = Zelle.new(false,@matrix[ e[0] ][ e[1] ].row,@matrix[ e[0] ][ e[1] ].column)

      @matrix[ e[0] ][ e[1] ]  = tempDead
    }

  end

  def lebende_nachbar_zellen(row, column)

    # tl, tc, tr, ml, mr, bl, bc, br
    alive = []

    if @matrix[row - 1]
      if @matrix[row - 1][column - 1].alive()  then alive << [row - 1, column - 1] end
      if @matrix[row - 1][column].alive()   then alive << [row - 1, column] end
      if @matrix[row - 1][column + 1]
        if @matrix[row - 1][column + 1].alive()  then alive << [row - 1, column + 1] end
      end
    end

    if @matrix[row][column - 1].alive()  then alive << [row, column - 1] end
    if @matrix[row][column + 1]
      if @matrix[row][column + 1].alive() then alive << [row, column + 1] end
    end

    if @matrix[row + 1]
      if @matrix[row + 1][column - 1].alive()   then alive << [row + 1, column - 1] end
      if @matrix[row + 1][column].alive()  then alive << [row + 1, column] end
      if @matrix[row + 1][column + 1]
        if @matrix[row + 1][column + 1].alive()  then alive << [row + 1, column + 1] end
      end
    end

    return alive
  end

  def zuruecksetzen()
    # Löscht alle
    Leinwand.gib_einzige_instanz().zuruecksetzen()
    @generation = []
    @matrix = @backupMatrix

  end

  def simuliere(schritte)
    schritte += 1
    generation = 0
    TkTimer.new(100,schritte, proc{


      visualisiere_generation(generation)
      generation+=1
      self.naechste_generation()
      @generation << @matrix

    }).start(0, proc{})
    puts
  end

  def visualisiere_generation(generation)

    x =  ((generation * (@size * 12))) - (@size * 12) + (generation * 14) # boxen mit abstand anzeigen
    y =  10

    background = Rechteck.new(Point.new(x-1,y-1),(@size * 12),(@size * 12),:black,true)
    background.sichtbar_machen

    @matrix.each_with_index{|rowElm, rowInx|

      rowElm.each_with_index{|colElm, colInx|

        if colElm.alive == @constAlive.alive
          box = Rechteck.new(Point.new(x,y),10,10,:green,true)
          box.sichtbar_machen
        else
          box = Rechteck.new(Point.new(x,y),10,10,:white,true)
          box.sichtbar_machen
        end

        x += 12
      }
      y += 12
      x =  ((generation * (@size * 12))) - (@size * 12) + (generation * 14)
      puts
    }
    puts
  end

end

class Zelle
  attr_reader :alive, :row, :column
  def initialize(value, row, column)
    @alive = value
    @row = row
    @column = column
  end

  def alive?()
    return @alive
  end

  def row?()
    return @row
  end

  def column?()
    return @column
  end

  def position?()
    return "#{@row} #{@column}"
  end

  def wechseln()
    @alive = !alive?()
    return self
  end

 

  def to_s()
    ausgabe = "Zelle: "

    if alive? 
      ausgabe = ausgabe + "lebt"
    else
      ausgabe = ausgabe + "tot "
    end
    ausgabe = ausgabe + " - Reihe: #{@row} - Spalte: #{@column}"
    return   ausgabe

  end
end

