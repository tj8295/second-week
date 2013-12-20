module Forest
  class Rock ; end
  class Tree ; end
  class Animal ; end
end

module Town
  class Pool ; end
  class Cinema ; end
  class Square ; end
  class Animal ; end
end

puts Forest::Tree.new.class.name
p Forest::Rock.new
p Town::Cinema.new

p Forest::Animal.new
p Town::Animal.new
