require 'practice'
require 'rspec'

describe Array do
  
  describe "#my_unique" do
    arr = [1,2,1,3,3]
    
    it "has no repeat characters" do
      expect(arr.my_unique).to eq([1,2,3])
    end
    
    it "returns a new array" do
      expect(arr.object_id).to_not eq(arr.my_unique.object_id)
    end
    
    it "does not recieve #uniq" do
      expect(arr).to_not receive(:uniq)
      arr.my_unique
    end
  end

  describe "#two_sum" do
    
    arr = [-1,0,2,-2,1]
    it "finds all pairs of positions where the elements at those positions sum to zero" do    
      expect(arr.two_sum).to eq([[0,4],[2,3]])  
    end
    
    it "returns smaller elements first in the array" do  
      expect(arr.two_sum).to_not eq([[2,3],[0,4]])
    end
  end
  
  describe "#my_transpose" do
    transpose_array = [[0, 1, 2],[3, 4, 5],[6, 7, 8]]
    transposed_array = [[0, 3, 6],[1, 4, 7],[2, 5, 8]]
    
    it "converts between the row-oriented and column-oriented representations" do
      expect(transpose_array.my_transpose).to eq(transposed_array)
    end
    
    it "does not use #transpose" do
      expect(transpose_array).to_not receive(:transpose)
      transpose_array.my_transpose
    end
  end
  
  describe "#stock_picker" do 
    stock_array = [4,3,2,2,1,2,2,3,4,5,6,7,8,9,10,9,8,7,6,5,4,3,2,1,0]
    
    it "returns an array of the lowest stock price index and highest price index in consecutive order" do
      expect(stock_array.stock_picker).to eq([4,14])  
    end 
    
    it "the sell index comes after the buy index" do
      expect(stock_array.stock_picker).to eq([4,14])
      expect(stock_array.stock_picker).to_not eq([24,14])
    end
  end 
end

describe TowersOfHanoi do
  subject(:towers) { TowersOfHanoi.new([[3,2,1],[],[]]) } 
  
  it "generates a TowersOfHanoi instance" do
    expect(towers.class).to eq(TowersOfHanoi)
  end
  
  describe "#initialize" do
    
    it "TowersOfHanoi accepts an argument when a new instance is created" do
      expect { TowersOfHanoi.new([[3,2,1],[],[]]) }.to_not raise_error
    end
    
    it "sets an instance variable 'board' with a class type Array" do
      expect(towers.board.class).to eq(Array)
    end
    
    it "instance variable 'board' contains three arrays" do
      expect(towers.board.length).to eq(3)
      expect(towers.board.all? {|el| el.class == Array}).to be true
    end
    
    it "the first tower has consecutively decreasing discs represented as Integers" do
      expect(towers.board[0].length).to eq(3)
      expect(towers.board[0][0] > towers.board[0][1]).to be true
      expect(towers.board[0][1] > towers.board[0][2]).to be true
    end    
  end
  
  describe "#move" do
    it "accepts two arguments" do
      expect{ towers.move(1,2) }.to_not raise_error
    
    end
    it "only accepts the numbers 0,1,2" do
      expect{ towers.move(5,8) }.to raise_error
    end 
  end
  
  
  describe "#game" do
    it "prompts the user for tower number using gets" do
      expect(towers).to receive(:firstpic)
      towers.game
    end
    
    it "prompts the user for tower number using gets" do
      expect(towers).to receive(:secondpic)
      towers.game
    end
  
    it "checks to see if a winning play was made" do
      expect(towers).to receive(:win?)
      towers.game
    end
  end
  
  describe "#win?" do
    it "checks to see if the current board is equal to a winning board" do
      winning_board = TowersOfHanoi.new([[],[],[3,2,1]])
      winning_board_2 = TowersOfHanoi.new([[],[3,2,1],[]])
      expect(winning_board.win?).to be true
      expect(winning_board_2.win?).to be true 
      expect(towers.win?).to be false
    end
  end
end

  #[[3,2,1],[],[]]
