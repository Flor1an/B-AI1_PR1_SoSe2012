require "Set"
require "Relation"
require "Tupel"

class RelationenGenerator

  def RelationenGenerator.generiere_relation(set_a, set_b, k)
      relation = Relation.new(set_a, set_b)
      begin
        relation.add( Tupel.new( Array(set_a).sample(), Array(set_b).sample() ) )
      end while( relation.size() != k )
      return relation.info()
  end

  def RelationenGenerator.generiere_abbildung(set_a, set_b)
    relation = Relation.new(set_a, set_b)
    set_a.each{|elm|
      relation.add( Tupel.new(elm, Array(set_b).sample) )
    }
    return relation.info()
  end

end



a = Set.new [1,2,3]
b = Set.new [4,5,6]
k = 4
inst = RelationenGenerator.generiere_relation(a,a,k)
exit

a = Set.new [1,2,3,4,5,6,7,8]
b = Set.new [5,6,7]
inst = RelationenGenerator.generiere_abbildung(a, b)

