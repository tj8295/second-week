class Being
  @@count = 0

  def initialize
    @@count += 1
    puts "Being class created"
  end

  def show_count
    "There are #{@@count} beings"
  end

  private :show_count
end

class Human < Being

  def initialize
    super
    puts "Human is created."
  end
end

class Animal < Being
  def initialize
    super
        @bat = 'two'

    puts "Animal is created"

  end
end

class Dog < Animal
  def initialize
    super
    puts "Dog is created"
    puts @bat
  end
end

Human.new
d = Dog.new
puts d.show_count

