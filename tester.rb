class Tester
  attr_accessor :points

  def initialize
    @points = 5
  end

  def add_points
    self.points = 5 + 7
  end

end

test = Tester.new
test.points = 5
puts test.points
test.add_points
puts test.points
