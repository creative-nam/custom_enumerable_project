module Enumerable
  # Your code goes here
  def my_all?
    if block_given?
      my_each do |value|
        yield value or return false
      end

      true
    else
      # Check if there's any value which *isn't* truthy, and return accordingly
      my_any? { |value| !value } ? false : true
    end
  end

  def my_any?
    if block_given?
      self.my_each do |value|
        yield value and return true
      end
    else
      self.my_each do |value|
        return true if value
      end
    end

    false
  end

  def my_count
    return self.size unless block_given?

    truthy_values = 0

    my_each do |value|
      yield value and truthy_values += 1
    end

    truthy_values
  end

  def my_each
    for item in self do
      yield item
    end

    self
  end

  def my_inject(initial_value = nil)
    reduced_value = initial_value ? initial_value : self[0]
  
    my_each_with_index do |value, index|
      next if index == 0 && !initial_value
  
      reduced_value = yield reduced_value, value
    end
  
    reduced_value
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
end
