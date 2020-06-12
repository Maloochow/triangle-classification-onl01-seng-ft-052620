class Triangle
attr_accessor :sides

def initialize(a, b, c)
  @sides = [a, b, c]
end

def kind
  if side_0? || side_invalid?
    raise TriangleError
  elsif sides[0] == sides[1] && sides[0] == sides[2]
    :equilateral
  elsif isosceles?
    :isosceles
  else
    :scalene
  end
end

def sides_combo
  sides.combination(2).to_a
end

def side_invalid?
  sides_combo.detect {|i| i[0] + i[1] <= (sides - [i[0], i[1]]).join.to_i}
end

def side_0?
  sides.detect {|a| a <= 0 }
end


def isosceles?
  sides_combo.detect {|combo| combo[0] == combo[1]}
end

class TriangleError < StandardError
end

end
