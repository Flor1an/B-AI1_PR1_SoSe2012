class Tupel
  attr_reader :x, :y
  #attr_writer :x, :y
  def initialize(a,b)
    @x = a
    @y = b
  end
  
  def to_s
    return "(#{@x},#{@y})"
  end
  
end