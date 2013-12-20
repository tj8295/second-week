class Box
  # Initialize our claas variables
  @@count = 0
  def initialize(w, h)
    # assign instance variables
    @width, @height = w, h

    @@count += 1
  end

  def self.print_count
    puts "Box count is: #{@@count}"
  end
end

# create two objects
box_1 = Box.new(10, 20)
box_2 = Box.new(30, 100)

# call class method to print box count
Box.print_count
