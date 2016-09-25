module Sudoku
  class Unit
    attr_accessor :value, :candidates
    def initialize(value)
      @value = value
      @candidates = (value.nil?) ? (0..8).map.with_index{|x| x+1} : []
    end

    # def draw(options={indentation: 0})
    def draw
box = <<-EOL
+-------+
| 1 2 3 |
| 4 5 6 |
| 7 8 9 |
+-------+
EOL
    end
  end
end


