module Sudoku
  class Board
    include Square
    
    attr_accessor :board

    def initialize(game_data)
      # @board = (0..8).map{|x| (0..8).map{|x| []}}
      @board = game_data.map do |row|
        row.map do |unit|
          Unit.new(unit)
        end
      end
    end

    def rand_num(&blk)
      #num = nil
      #while ((num = (rand * 10).floor) < 1) do; end
      num = (rand * 10).floor
      padding = blk.call
      (num == 0) ? padding : "#{' ' * (padding.length/2).floor}#{num}#{' ' * (padding.length/2).floor}"
    end

    def unit_value(row, col, &blk)
      num = board[row][col]
      padding = blk.call
      (num.nil?) ? padding : "#{' ' * (padding.length/2).floor}#{num}#{' ' * (padding.length/2).floor}"
    end

    def draw_cell_partial(unit, pidx, cidx)
      if(unit.value.nil?)
        "| #{cidx} #{cidx+1} #{cidx+2} | "
      elsif(pidx == 2)
        "|   #{unit.value}   | "
      else
        "|       | "
      end
    end

    def draw
      res = []
      square_padding = '   '

      board.each.with_index do |row, bsidx|
        c_offset = 1

        (0..4).each do |idx|
          col_offset = -1

          if(idx == 0)
            res << square_padding if(bsidx != 0 and ((bsidx % 3) == 0))
            res << (square_padding + ("+-------+ +-------+ +-------+ #{square_padding}" * 3))
          elsif(idx == 4)
            res << (square_padding + ("+-------+ +-------+ +-------+ #{square_padding}" * 3))
          else
            out = []
            out << "#{square_padding}"
            
            out << draw_cell_partial(row[(col_offset+=1)], idx, c_offset)
            out << draw_cell_partial(row[(col_offset+=1)], idx, c_offset)
            out << draw_cell_partial(row[(col_offset+=1)], idx, c_offset)
            out << "#{square_padding}"

            out << draw_cell_partial(row[(col_offset+=1)], idx, c_offset)
            out << draw_cell_partial(row[(col_offset+=1)], idx, c_offset)
            out << draw_cell_partial(row[(col_offset+=1)], idx, c_offset)
            out << "#{square_padding}"

            out << draw_cell_partial(row[(col_offset+=1)], idx, c_offset)
            out << draw_cell_partial(row[(col_offset+=1)], idx, c_offset)
            out << draw_cell_partial(row[(col_offset+=1)], idx, c_offset)
            res << out.join("")

            c_offset += 3
          end
        end
      end

      "\n#{res.join("\n")}\n\n"
    end
  end
end
