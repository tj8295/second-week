class Dog
  attr_accessor :name, :height, :weight

  @@count = 0

  def self.total_dogs
    "Total number of dogs: #{@@count}"
  end

  def initialize(name, height, weight)
    @name = name
    @height = height
    @weight = weight
    @@count += 1
  end

  def speak
    @name + " barks!"
  end

  def info
    "#{name} is #{height} feet tall and weighs #{weight} pounds"
  end

  def update_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def ssn
    "xxx-xx-" + @ssn.split('-').last
  end

  def ssn=(new_ssn)
    if valid_format?(new_ssn)
      @ssn = new_ssn
    end
  end
end

teddy = Dog.new('teddy', 3, 95)
fido = Dog.new('fido', 1, 35)

puts fido.speak
puts teddy.speak

puts teddy.info
puts fido.info

teddy.name = "Roosevelt"
puts teddy.info
puts teddy.weight
puts teddy.height

puts teddy.info
teddy.update_info('Roosevelt', 5, 125)
puts teddy.info

puts Dog.total_dogs
