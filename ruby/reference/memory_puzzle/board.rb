require_relative 'card.rb'

class Board
  attr_reader :size

  def initialize(size)
    raise 'Max board size is 10' if size > 10
    if size % 2 == 1
      size += 1
      puts "Size must be an even number. Let me round that up to #{size} for you."
    end

    @grid = Array.new(size) { Array.new(size) }
    @size = size
  end

  def [](coordinates)
    raise "Must provide exactly two coordinates (row, col)" if coordinates.length != 2
    row, col = coordinates
    @grid[row][col]
  end

  def []=(coordinates, value)
    row, col = coordinates
    @grid[row][col] = value
  end

  def board_is_full?
    @grid.flatten.each { |square| return false if square == nil }
    true
  end

  def empty_squares
    squares = []

    (0...@grid.length).each do |row|
      (0...@grid.length).each do |col|
        squares << [row, col] if self[[row, col]] == nil
      end
    end

    squares
  end

  def unrevealed_squares
    squares = []

    (0...@grid.length).each do |row|
      (0...@grid.length).each do |col|
        squares << [row, col] if self[[row, col]].revealed == false
      end
    end

    squares
  end

  def populate
    # Generate symbols for game
    alphabet_upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    alphabet = alphabet_upper + alphabet_upper.downcase
    all_symbols = alphabet.split('').map(&:to_sym)
    symbols_for_game = all_symbols.sample((@grid.length ** 2) / 2)
    
    # Populate empty squares at random, starting with first symbol in array and iteratively shifting off until none are left
    until symbols_for_game.empty?
      2.times do
        square = self.empty_squares.sample
        self[square] = Card.new(symbols_for_game[0])
      end
      
      symbols_for_game.shift
    end
  end

  def render
    self.board.populate if !self.board_is_full?
    
    puts "-" * 2 * (@grid.length + 1) 
    header = " "
    (0...@grid.length).each { |i| header += " " + i.to_s }
    puts header

    @grid.each_with_index do |row, i|
      row_to_print = i.to_s
      row.each { |card| row_to_print += " " + card.display }
      puts row_to_print
    end

    puts "-" * 2 * (@grid.length + 1) 

    nil
  end

  def won?
    @grid.flatten.each { |card| return false if !card.revealed }
    true
  end

  def reveal(pos)
    card = self[pos]
    card.reveal
    card.value
  end

  def hide(pos)
    card = self[pos]
    card.hide
  end
end