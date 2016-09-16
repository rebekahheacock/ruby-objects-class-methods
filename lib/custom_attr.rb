# Dumb linter wants a comment
class Bar
  # we have to define this method on `self` (see below comment)
  def self.attribute_reader(attribute)
    # define_method defines an INSTANCE method on the receiver
    # the receiver in this case is the class Bar
    # the method is defined on instances of bar
    # define_method is same inside a class as def methodname
    define_method attribute do
      # self here is the instance
      puts "self is #{self}"
      self.instance_variable_get("@#{attribute}")
    end
  end

  def self.attribute_writer(attribute)
    define_method "#{attribute}=".to_sym do |value|
      self.instance_variable_set("@#{attribute}", value)
    end
  end

  def self.attribute_accessor(attribute)
    attribute_reader attribute
    attribute_writer attribute
  end

  # these methods are executed within the definition of the Bar class

  # attribute_reader :foo behaves like this:
  # def foo
  #   @foo
  # end
  # attribute_reader is a method call on the class
  attribute_reader :foo
  attribute_writer :bar
  attribute_accessor :baz
end
