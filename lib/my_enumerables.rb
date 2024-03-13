module Enumerable
  # Your code goes here
  def my_all?
    self.my_each do |el|
      return false unless yield(el)
    end
    true
  end

  def my_any?
    self.my_each do |el|
      return true if yield(el)
    end
    false
  end

  def my_count
    if block_given?
      count = 0
      self.my_each do |data|
        count += 1 if yield(data)
      end
      return count
    else
      size
    end
  end

  def my_each_with_index
    i = 0
    self.my_each do |data|
      yield(data, i)
      i += 1
    end
  end

  def my_inject(sum)
    self.my_each do |data|
      sum = yield(sum, data)
    end
    sum
  end

  def my_map
    map = Array.new
    self.my_each do |data|
      map.push(yield(data))
    end
    map
  end

  def my_none?
    self.my_each do |data|
      return false if yield(data)   
    end
    true   
  end

  def my_select
    select = []
    self.my_each do |data|
      select.push(data) if yield(data)
    end
    select
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
   for el in self
      yield el
   end
  end
end
