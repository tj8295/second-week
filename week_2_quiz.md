1.
@a = 2    
   @a is an instance variable, and is a Fixnum object with a value of 2
 user = User.new
   user is a local variable and is an object of class User
user.name 
 user.name is a call to an instance method on the user object
user.name = "Joe"
 user.name is a call to a setter method on an object of class User

2. Use the 'include' keyword

3. Class variables are created once and shared between objects of a instances of that class and subclassses.  Instance variables are created for each instance of a class.

4. Creates getter and setter methods and instance variables that those methods operate on. 

5. some_method is a class method that is being called of the Dog class.

6. When you subclass you have access to some of the methods of all the classes in the class hierarchy.
You can subclass from one base class. When you mixin a module you have access to the methods from the module. A
class can mixin mutiple modules. subclassing can be seen as a is_a relationship with the classes in it hierarchy. classes that mixin modulels describe a has_a relationship.

7. 
def initialize(name)
    @name = name
end

8. Yes

9. You can use binding.pry before the block of code that is giving the error and query the values of the different variables.


