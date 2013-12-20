class Box
  BOX_COMPANY = "TATA inc"
  BOXWEIGHT = 10

  def initialize(w, h)
    @width, @height = w, h
  end

    def +(other) # Define + to do vector addition
    Box.new(@width + other.width, @height + other.height)
  end

  def -@
    Box.new(-@width, -@height)
  end

  def *(scalar)
    Box.new(@width*scalar, @height*scalar)
  end
end

box = Box.new(10, 20)

# call instance methods
puts Box::BOX_COMPANY
puts "Box weight is: #{Box::BOXWEIGHT}"

