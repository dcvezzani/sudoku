require 'byebug'

require_relative 'sudoku/square'
require_relative 'sudoku/row'
require_relative 'sudoku/column'
require_relative 'sudoku/unit'
require_relative 'sudoku/board'

module Sudoku
  class Game
    attr_accessor :board

    def initialize(game_data)
      @board = Board.new(game_data)
    end
  end
end

game01 = [
  [nil, nil, nil, 1, nil, 5, nil, nil, nil], 
  [1, 4, nil, nil, nil, nil, 6, 7, nil], 
  [nil, 8, nil, nil, nil, 2, 4, nil, nil], 
  [nil, 6, 3, nil, 7, nil, nil, 1, nil], 
  [9, nil, nil, nil,  nil, nil, nil, nil, 3], 
  [nil, 1, nil, nil, 9, nil, 5, 2, nil], 
  [nil, nil, 7, 2, nil, nil, nil, 8, nil], 
  [nil, 2, 6, nil, nil, nil, nil, 3, 5], 
  [nil, nil, nil, 4, nil, 9, nil, nil, nil]
]

game = Sudoku::Game.new(game01)

puts game.board.draw

=begin
+-------+ +-------+ +-------+
| 1 2 3 | | 1 2 3 | | 1 2 3 |
| 4 5 6 | | 4 5 6 | | 4 5 6 |
| 7 8 9 | | 7 8 9 | | 7 8 9 |
+-------+ +-------+ +-------+
+-------+ +-------+ +-------+
| 1 2 3 | | 1 2 3 | | 1 2 3 |
| 4 5 6 | | 4 5 6 | | 4 5 6 |
| 7 8 9 | | 7 8 9 | | 7 8 9 |
+-------+ +-------+ +-------+
+-------+ +-------+ +-------+
| 1 2 3 | | 1 2 3 | | 1 2 3 |
| 4 5 6 | | 4 5 6 | | 4 5 6 |
| 7 8 9 | | 7 8 9 | | 7 8 9 |
+-------+ +-------+ +-------+
=end
