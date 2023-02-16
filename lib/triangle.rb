require 'pry'

class Triangle
  def initialize(length1, length2, length3)
    
    @sides = [length1, length2, length3]
    @sides.each_with_index do |side, idx| 
      if ((@sides[(idx + 1)%3] + @sides[(idx + 1)%3]) <= side )
        raise TriangleError
      end
    end
    
    @sides.each do |side| 
      if side <= 0 
        raise TriangleError
      end
    end
  end

  def kind
    if @sides.uniq.length == 1
    :equilateral
    elsif @sides.uniq.length == 2
    :isosceles
    else
    :scalene
    end
  end

  class TriangleError < StandardError
    def message      
    end
  end

end

t1 = Triangle.new(12,23,12)
t2 = Triangle.new(13,24,15)
t3 = Triangle.new(11,11,11)

binding.pry