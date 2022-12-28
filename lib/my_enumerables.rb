module Enumerable
  # Your code goes here
  def my_each
    for item in self do
      yield item
    end

    self
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
end
