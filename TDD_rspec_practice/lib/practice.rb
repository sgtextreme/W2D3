class Array

  def my_unique
    arr = []
    
    self.each do |el| 
      unless arr.include? el
        arr << el
      end 
    end
     
    arr
  end
  
  def two_sum 
    arr = []
    self.each_with_index do |num1, i|
      (i+1...length).each do |j|
        if num1 + self[j] == 0 
          arr << [i,j]
        end 
      end
    end 
    arr 
  end 
  
  def my_transpose
    transposed = []
    
    self.length.times do |i|
      temp = []
      self.length.times do |j|
        temp << self[j][i]
      end
      transposed << temp
    end
    transposed
  end
  
  
  def stock_picker 
    stock_pick_array = [0,0]
    
    self.each_index do |i|
      (i+1...length).each do |j|
        if self[j] - self[i] > self[stock_pick_array[1]] - self[stock_pick_array[0]]
          stock_pick_array[0] = i
          stock_pick_array[1] = j
        end
      end
    end
    
    stock_pick_array
  end
end


class TowersOfHanoi
  attr_reader :board
  
  def initialize(board = [[3,2,1],[],[]])
    @board = board
  end
  
  def firstpic 
    # firstpic = gets.chomp
  end
  
  def secondpic 
    # secondpic = gets.chomp
  end
  
  def move(move1,move2)
    if move1.between?(0,2) && move2.between?(0,2)
       
    else
    raise StandardError
    end
  end
  
  def game 
    first = self.firstpic
    second = self.secondpic
    move(first, second)
    
    self.win? 
  end
  
  def win?
    if (@board[0].empty? && @board[1].length == 3) || @board[0].empty? && @board[2].length == 3
      return true
    end 
    false 
  end
  
end