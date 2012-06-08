require "Potenzmenge"

class Relation
  include Enumerable

 attr_reader :mengeA, :mengeB
 # attr_writer :menge, :relation
  
  def initialize(mengeA=Set.new(), mengeB=Set.new())
    @mengeA = mengeA
    @mengeB = mengeB
    @relation = Set.new()
  end

  def add(tupel)
    if(!@relation.one?{|elm| elm.x == tupel.x && elm.y == tupel.y })
      @relation.add(tupel)
    else
    #  p "Dublette: #{tupel}"
    end
  end

  def size()
    return @relation.size()
  end

  def each(&b)
    @relation.each(&b)
  end

  def reflexiv?()
    reflexiv = []
    self.each{|tupel|
      if(tupel.x == tupel.y)
        reflexiv << tupel.to_s
      end
    }
    return reflexiv.size() ? reflexiv : false
  end

  def symmetrisch?()
    symmetrisch = []
    self.each{|tupel|
      if(@relation.one?{|elm| tupel.x == elm.y && tupel.y == elm.x})
        symmetrisch << tupel
      end
    }
    return symmetrisch.size() > 0 ? symmetrisch : false
  end

  def asymmetrisch?()
    if(self.symmetrisch?())
      return false
    end
    return true
  end

  def anti_symmetrisch?()
    anti_symmetrisch = []
    self.each{|tupel|

      if(@relation.one?{|elm| tupel.x == elm.y && tupel.y == elm.x && tupel.x == tupel.y})
        anti_symmetrisch << tupel
      end
    }
    return anti_symmetrisch.size() > 0 ? anti_symmetrisch : false
  end

  def transitiv?()

    transitiv = []
    self.each{|tupel1|
      self.each{|tupel2|
        next if tupel1 == tupel2
        if(tupel1.y == tupel2.x)
          self.each{|tupel3|
            next if tupel1 == tupel2 || tupel1 == tupel3 || tupel2 == tupel3

            #            p tupel1
            #            p tupel2
            #            p tupel3
            #            p "#{tupel1.x} - #{tupel3.y}"
            if(tupel1.x == tupel3.x && tupel2.y == tupel3.y)
              transitiv << [tupel1, tupel2, tupel3]
            end
          }
        end
      }
    }
    return transitiv.size() > 0 ? transitiv : false
  end

  def rechts_eindeutig?()
    toreturn = []
    self.each{|tupel1|
      self.each{|tupel2|
        next if tupel1 == tupel2
        if(tupel1.y == tupel2.y)
          toreturn << [tupel1, tupel2]
        end
      }
    }
    return toreturn.size() > 0 ? toreturn : false
  end

  def links_eindeutig?()
    toreturn = []
    self.each{|tupel1|
      self.each{|tupel2|
        next if tupel1 == tupel2
        if(tupel1.y == tupel2.y && tupel1.x == tupel2.x)
          toreturn << [tupel1, tupel2]
        end
      }
    }
    return toreturn.size() > 0 ? toreturn : false
  end

  def eindeutig?()
    if(self.links_eindeutig?() && self.rechts_eindeutig?())
      return true
    end
    return false
  end

  def rechts_total?()
    i=0   
    self.each{|tupelL|
      self.each{|tupelR|
            next if tupelL == tupelR
            if (tupelL.x == tupelR.x)
              i +=1
            end
      }
    }
    if @mengeB.size >= i
      return true
    end
    return false
  end

  def links_total?()
    i=0   
    self.each{|tupelL|
      self.each{|tupelR|
            next if tupelL == tupelR
            if (tupelL.x == tupelR.x)
              i +=1
            end
      }
    }
    if @mengeA.size >= i
      return true
    end
    return false
  end

  def verknuepfe(relation)
    neueRelation = self.kopiere()
    @relation.each{|tupel|
      neueRelation.add(tupel)
    }
    return neueRelation
  end

  def reflexiver_abschluss()
    abschluss = self.kopiere()
    self.each{|tupel|
      abschluss.add( Tupel.new(tupel.x, tupel.x) )
      abschluss.add( Tupel.new(tupel.y, tupel.y) )
    }
    return abschluss.display()
  end

  def symmetrischer_abschluss()
    abschluss = self.kopiere()
    self.each{|tupel|
      abschluss.add( Tupel.new(tupel.y, tupel.x) )
    }
    return abschluss.display()
  end

  def transitiver_abschluss()
    abschluss = self.kopiere()
    self.each{|tupel1|
      self.each{|tupel2|
        next if tupel1 == tupel2
        if(tupel1.y == tupel2.x)
          abschluss.add( Tupel.new(tupel1.x, tupel2.y) )
        end
      }
    }
    return abschluss.display()
  end

  def invertiere()
    invers = Relation.new()
    self.each{|tupel|
      invers.add( Tupel.new(tupel.y, tupel.x) )
    }
    return invers.display()
  end

  def kopiere()
    relation = Relation.new()
    self.each{|tupel| relation.add( tupel.dup )}
    return relation
  end

  def display()
    arr = []
    self.each{|t| arr << t.to_s}
    return 'R = { ' + arr.join(', ') + ' }'
  end
  
  def abbildung?()
    return self.links_eindeutig?()
  end
  
  def injektiv?()
    return self.links_eindeutig()
  end
  
  def surjektiv?()
    return self.rechts_total()
  end
  
  def komposition(andere)
    komp = Relation.new()
    andere.each{|a|
      @relation.select{|b| a.y == b.x }.each{|tupel|
      komp.add( Tupel.new(tupel.x, tupel.y) )
      komp.mengeA.add(tupel.x)
      komp.mengeB.add(tupel.y)
      }
    }
    return komp
  end
  
  def urbild()
    if(self.abbildung?())
      urbild = {}
      @relation.each{|tupel1|
        @relation.each{|tupel2|
          next if tupel1 == tupel2
          urbild[ tupel2.y ] = urbild[ tupel2.y ] || []
          if(tupel1.x == tupel2.y)
            urbild[ tupel2.y ] << tupel2.y
          end
        }
      }
    end
  end

  def info()
    relation = []
    @relation.each{|tupel|
      relation << "(#{tupel.x},#{tupel.y})"
    }
    puts "R = { #{relation.join(', ')} }"
    puts "Menge A: #{@mengeA}"
    puts "Menge B: #{@mengeB}"
    puts "- - - - - - - - - - - - - - - -"
    puts "Reflexsiv: #{self.reflexiv?()}\n"
    puts "Symmetrisch: #{self.symmetrisch?()}\n"
    puts "Asymmetrisch: #{self.asymmetrisch?()}\n"
    puts "Anti Symmetrisch: #{self.anti_symmetrisch?()}\n"
    puts "Transitiv: #{self.transitiv?()}\n"
    puts "Rechts_eindeutig: #{self.rechts_eindeutig?()}\n"
    puts "Links_eindeutig: #{self.links_eindeutig?()}\n"
    puts "Eindeutig: #{self.eindeutig?()}\n"
    puts "Links_total: #{self.links_total?()}\n"
    puts "Rechts_total: #{self.rechts_total?()}\n"
    puts "Reflexiver Abschluss: #{self.reflexiver_abschluss()}"
    puts "Symmetrischer Abschluss: #{self.symmetrischer_abschluss()}"
    puts "Transitiver Abschluss: #{self.transitiver_abschluss()}"
    puts "Invertiert: #{self.invertiere()}"
  end

end