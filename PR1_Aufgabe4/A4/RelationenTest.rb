require "test/unit"
require "Relation"
require "Tupel"
require "Set"
require "RelationenGenerator"
require "Potenzmenge"

class RelationenTest < Test::Unit::TestCase
  def setup()
    @A = Set.new [1,2,3]
    @B = Set.new [4,5,6]
    @K = 4
    @relation = RelationenGenerator.generiere_relation(@A, @B, @K)
    @eigenschaften = RelationenGenerator.new()
  end

  def test_generator()
    assert_equal(@relation.size(), @K)
  end

  def test_dubletten()
    @relation.each{|first| break }
    @relation.add(first)
    assert_equal(@relation.size(), @K)
  end

  def test_tupel_hinzufügen()
    @relation.add(  Tupel.new(10,11) )
    assert_equal(@relation.size(), @K)
  end

  def test_relation_groesse()
    assert_equal(@relation.size(), @K + 1)
  end

  def test_relation_enum()
    assert(@relation.respond_to('each'))
  end

  def test_reflexiv()
    rel = RelationenGenerator.new()
    rel.add( Tupel.new(1,1) )
    rel.add( Tupel.new(2,2) )
    assert_equal( rel.size(), 2 )
  end

  def test_symmetrisch()
    rel = RelationenGenerator.new()
    rel.add( Tupel.new(1,2) )
    rel.add( Tupel.new(2,1) )
    assert_equal( rel.size(), 1 )
  end

  def test_asymmetrisch()
    assert_equal( self.test_symmetrisch(), false )
  end

  def test_anti_symmetrisch()
    rel = RelationenGenerator.new()
    rel.add( Tupel.new(1,1) )
    rel.add( Tupel.new(2,2) )
    assert_equal( rel.size(), 1 )
  end

  def test_transitiv()
    rel = RelationenGenerator.new()
    rel.add( Tupel.new(1,2) )
    rel.add( Tupel.new(2,3) )
    rel.add( Tupel.new(1,3) )
    assert_equal( rel.size(), 1 )
  end

  def test_rechts_eindeutig()
    rel = RelationenGenerator.new()
    rel.add( Tupel.new(1,2) )
    rel.add( Tupel.new(5,2) )
    assert_equal( rel.size(), 1 )
  end

  def test_links_eindeutig()
    rel = RelationenGenerator.new()
    rel.add( Tupel.new(1,3) )
    rel.add( Tupel.new(2,3) )
    assert_equal( rel.size(), 1 )
  end

  def test_rechts_total()
    a = Set.new [1,2,3]
    b = Set.new [3,4,5]
    rel = RelationenGenerator.generiereRelation( a, b )
    rel.add( Tupel.new(1,3) )
    rel.add( Tupel.new(1,4) )
    rel.add( Tupel.new(1,5) )
    assert( rel )
  end

  def test_links_total()
    a = Set.new [1,2,3]
    b = Set.new [3,4,5]
    rel = RelationenGenerator.generiereRelation( a, b )
    rel.add( Tupel.new(1,3) )
    rel.add( Tupel.new(2,4) )
    rel.add( Tupel.new(3,5) )
    assert( rel )
  end

  def test_verknuepfe()
    a = Set.new [1,2,3]
    b = Set.new [4,5,6]

    rel1 = RelationenGenerator.new(a,b)
    rel1.add( Tupel.new(1,4) )
    rel1.add( Tupel.new(2,5) )
    rel1.add( Tupel.new(3,6) )

    rel2 = RelationenGenerator.new(a,b)
    rel2.add( Tupel.new(1,6) )
    rel2.add( Tupel.new(2,4) )
    rel2.add( Tupel.new(3,4) )
    rel2.verknuepfe(rel1)
    assert_equel(rel2.size(), 6)
  end

  def test_reflexiver_abschluss()
    rel = RelationenGenerator.new()
    rel.add( Tupel.new(1,2) )
    assert_equal( rel.size(), 3 )
  end

  def test_symmetrischer_abschluss()
    rel = RelationenGenerator.new()
    rel.add( Tupel.new(1,2) )
    assert_equal( rel.size(), 2 )
  end

  def test_transitiver_abschluss()
    rel = RelationenGenerator.new()
    rel.add( Tupel.new(1,2) )
    rel.add( Tupel.new(2,3) )
    assert_equal( rel.size(), 3 )
  end

  def test_kopiere()
    rel = RelationenGenerator.new()
    rel2 = rel.kopiere()
    assert_not_equel(rel.object.id != rel2.object.id)
  end

end