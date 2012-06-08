#Generation t
#- - - - - -
#- - * - - -
#- - - * - -
#- * * * - -
#- - - - - -
#- - - - - -
#
#Die Ausgabe für das Muster für t=5 Simulationsschritte sieht wie folgt aus:
#
#Generation t+1
#- - - - - -
#- - - - - -
#- * - * - -
#- - * * - -
#- - * - - -
#- - - - - -
#
#Generation t+2
#- - - - - -
#- - - - - -
#- - - * - -
#- * - * - -
#- - * * - -
#- - - - - -
#
#Generation t+3
#- - - - - -
#- - - - - -
#- - * - - -
#- - - * * -
#- - * * - -
#- - - - - -
#
#Generation t+4
#- - - - - -
#- - - - - -
#- - - * - -
#- - - - * -
#- - * * * -
#- - - - - -
#
#Generation t+5
#- - - - - -
#- - - - - -
#- - - - - -
#- - * - * -
#- - - * * -
#- - - * - -

class Life
  
  def initialize(n=6)
    @matrix = []

    n.times{|i|
      row = []
      n.times{|i|
        row << '-'
      }
      @matrix << row
    }
    @matrix[1][2] = '*'
    @matrix[2][3] = '*'
    @matrix[3][1] = '*'
    @matrix[3][2] = '*'
    @matrix[3][3] = '*'
  end

  def naechste_generation()
    awake = []
    asleep = []

    @matrix.each_with_index{|rowElm, rowInx|
      rowElm.each_with_index{|colElm, colInx|

        key = [rowInx, colInx]
        alive = self.lebende_nachbar_zellen(rowInx, colInx)

        # from dead to alive if three neighbours are alive
        if colElm.index('-') && alive.length == 3
          awake << key
        end

        # from alive to dead if one neighbour is alive
        if colElm.index('*') && alive.length == 1
          asleep << key
        end

        # from alive to dead if more then three neighbours are alive
        if colElm.index('*') && alive.length > 3
          asleep << key
        end
      }
    }

    # redefine matrix
    awake.each{|e|
     @matrix[ e[0] ][ e[1] ] = '*'
    }
    asleep.each{|e|
     @matrix[ e[0] ][ e[1] ] = '-'
    }

  end

  def lebende_nachbar_zellen(row, column)
    # tl, tc, tr, ml, mr, bl, bc, br
    alive = []
    if @matrix[row - 1]
      if @matrix[row - 1][column - 1] == '*' then alive << [row - 1, column - 1] end
      if @matrix[row - 1][column] == '*' then alive << [row - 1, column] end
      if @matrix[row - 1][column + 1] == '*' then alive << [row - 1, column + 1] end
    end

    if @matrix[row][column - 1] == '*' then alive << [row, column - 1] end
    if @matrix[row][column + 1] == '*' then alive << [row, column + 1] end

    if @matrix[row + 1]
      if @matrix[row + 1][column - 1] == '*' then alive << [row + 1, column - 1] end
      if @matrix[row + 1][column] == '*' then alive << [row + 1, column] end
      if @matrix[row + 1][column + 1] == '*' then alive << [row + 1, column + 1] end
    end
    return alive
  end

  def spielen(n)
    self.spielfeld_zeichnen()
    n.times{
      self.naechste_generation()
      self.spielfeld_zeichnen()
    }
  end

  def spielfeld_zeichnen
    @matrix.each{|row|
      row.each{|column|
        print " #{column} "
      }
      print "\n"
    }
    @matrix[0].length.times{
      print '###'
    }
    puts
  end

end

inst = Life.new()
inst.spielen(11)