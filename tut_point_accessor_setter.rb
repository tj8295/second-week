# define a class
class Box
  # constructor method
  def initialize(w, h)
    @width, @height = w, h
  end

  # accessor methods
  def print_width
    @width
  end

  def print_height
    @height
  end

  # make private the accessor methods
private :print_width, :print_height
  # setter methods
  def set_width=(value)
    @width = value
  end

  def set_height=(value)
    @height = value
  end

  def get_area
    @width * @height
  end

  def print_area
    @area = print_width * print_height
    puts "Big box area is : #{@area}"
  end

  protected :print_area

  def to_s
    "Box: Width: #{@width}, Height: #{@height}"
  end
end

# create a object
box = Box.new(10, 20)

# use setter methods
box.set_width = 30
box.set_height = 50

# use accessor methods
x = box.print_width
y = box.print_height

# call instance methods
a = box.print_area

puts "Width of the box is: #{x}"
puts "Height of the box is: #{y}"
puts "Area of the box is : #{a}"

puts "Value of to_s is #{box.to_s}"
