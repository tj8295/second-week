class Person
  def name
    @name
  end

  def name=(str)
    @name = str
  end
end

person = Person.new
person.name = 'Dennis'
puts(person.name)


class Man < Person
  attr_reader :sex
  attr_writer :sex
  attr_accessor :age

  def initialize
    self.name = 'Tom'
  end

end

tom = Man.new
tom.sex = "male"
tom.age = 32
puts(tom.name)
puts(tom.sex)
puts(tom.age)
