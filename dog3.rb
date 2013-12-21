class Dog
  attr_accessor :name

  def self.another_method
    "this is a CLASS method"
  end

  def initialize(n = 'teddy')
  end

  def method_name
    "this is an INSTANCE method"
  end
end

teddy = Dog.new

puts teddy.name
puts Dog.another_method
