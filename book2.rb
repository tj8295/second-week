class Book
PI = 3.141592
  attr_accessor :title, :pages

  # def to_s
  #   "This is a book: #{@title}, with pages: #{@pages}"
  # end
end

b1 = Book.new
b1.title = "Moby Dick"
b1.pages = 255

p "Title: #{b1.title} pages #{b1.pages}"
puts b1

puts Book::PI
