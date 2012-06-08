#TEIL A:
#Protokoll für die Klasse Menge implementieren
#Schreiben Sie eine Klasse MySet, die die folgenden Methoden implementiert.
#Informieren Sie sich zuvor in der Dokumentation der Klasse Set in Ruby über
#die Funktionsweise der Methoden. Repräsentieren Sie eine Menge intern als Array.

class MySet
  def initialize(ary=[])
    @localSet = ary
  end

  def &(other_set) # übereinstimmende values
    newSet = []
    other_set.each{|oVal|
      @localSet.each{|lVal|
        if oVal == lVal
          newSet << oVal
        end
      }
    }
    return newSet
  end

  def |(other_set) # zusammengefasste value (unique)
    other_set.each{|val|
      @localSet << val
    }
    return @localSet.uniq()
  end

  def -(other_set) # eins von dem anderen abziehen

    newSet = @localSet
    other_set.each{|val|
      newSet.delete(val)
    }

    return newSet
  end

  def <<(an_elem) # zusätzlichen wert hinzufügen
    @localSet << an_elem
    return @localSet.uniq()
  end

  def ^(other_set) # die die nicht übereinstimmen (gegenteil von &)

    newSet = []

    (other_set - @localSet).each {|val|
      newSet << val
    }

    (@localSet - other_set).each {|val|
      newSet << val
    }

    return newSet
  end

  def add?(an_elem) # einen hinzufügen und sich selber zurückgeben

    @localSet.each{|val|
      if val == an_elem
        return nil
      end
    }

    @localSet << an_elem
    return self # TODO: return self oder return an_elem ?!
  end

  def clear() # inhalt löschen
    @localSet = []
    return self
  end

  def delete(an_elem) # bestimmtes elemet löschen
    @localSet.delete(an_elem)
    return self
  end

  def delete?(an_elem) # bestimmtes löschen und besonders zurückgeben
    @localSet.each{|val|
      if val == an_elem
        @localSet.delete(an_elem)
        return self
      end
    }
    return nil
  end

  def empty?()
    if @localSet.size == 0
      return true
    else
      return false
    end
  end

  def include?(an_elem)
    @localSet.each{|val|
      if val == an_elem
        return true
      else
        return false
      end
    }
  end

  def proper_subset?(other_set)# {1,2,3} : {1,2}=true {1,2,3}=false

    i = 0
        @localSet.each{|lVal|
          other_set.each{|oVal|
            if lVal == oVal
              i += 1
            end
          }
        }
      
        if i>0 && i < other_set.size #=vom otherset alle(-1) im localset enthalten (da nicht alle übereinstimmen dürfen!)
          return true
        end
        return false
  end

  def proper_superset?(other_set) 
  
   #TODO
  
  end

  def subset?(other_set)

    i = 0
    @localSet.each{|lVal|
      other_set.each{|oVal|
        if lVal == oVal
          i += 1
        end
      }
    }
    if i == other_set.size
      return true
    end
    return false

  end

  def super_set?(other_set)
    i = 0
    @localSet.each{|lVal|
      other_set.each{|oVal|
        if lVal == oVal
          i += 1
        end
      }
    }
    if i > 0 && i != other_set.size  
      return true
    end
    return false
  end

  def to_a()
    @localSet.to_a
  end

end