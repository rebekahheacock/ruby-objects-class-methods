# Cat class
class Cat
  # @@ is a class variable
  # lives in the class
  # NOT the same thing as an instance variable (@)
  # don't use them. not a good use case for web app devs to use class variables
  # this is bad
  @@cats_count = 0

  def initialize(name)
    @name = name
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# kitty = Cat.new("Mr.Kitty");
