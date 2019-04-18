class Board
    @@lines = [@@line1 = {:a1 => ' ', :b1 => ' ', :c1 => ' '},
              @@line2 = {:a2 => ' ', :b2 => ' ', :c2 => ' '},
              @@line3 = {:a3 => ' ', :b3 => ' ', :c3 => ' '}]

    def initialize
        puts "       THE GAME BEGGINS      ".bg_blue
        @win = false
        @draw = false
        @@turn = 1
        display
    end
    private
    def display 
        puts "*** THE GAME OF MORBACK ! ***".bg_green.bold
        puts "       Lines : A, B, C       ".bg_green.bold       
        puts "      Columns : 1, 2, 3      ".bg_green.bold
        puts " TYPE A LINE AND ONE COLUMN  ".bg_red.bold
    
        puts "     EXAMPLE: A3,B1,C2..     ".bg_red.bold
        puts "*"*29
        drawBoard
    end
    public
    def drawBoard
        
            puts "*"*29
            puts "    Turn of player #{@@turn}   ".bg_cyan.bold
            puts "     A    B    C    "
            puts "   --------------  "
            puts "1 | #{@@line1[:a1]}  | #{@@line1[:b1]}  | #{@@line1[:c1]}  |          "
            puts "   --------------  "
            puts "2 | #{@@line2[:a2]}  | #{@@line2[:b2]}  | #{@@line2[:c2]}  |          "
            puts "   --------------  "
            puts "3 | #{@@line3[:a3]}  | #{@@line3[:b3]}  | #{@@line3[:c3]}  |          "
    
        
    end
    public
    def select(cell)
        @@lines.each do |row|
            row.each do |key, value|
                if key == cell && value == " "
                    @@turn.odd? ? row[key] = "☠️" : row[key] = "👿"
                    @@turn += 1
                end
            end
        end
    end
    public
    def check_board
        x_wins = ["☠️", "☠️", "☠️"]
        o_wins = ["👿", "👿", "👿"]

        winning_lines = [            
            [@@line1[:a1],@@line2[:a2],@@line3[:a3]],
			[@@line1[:b1],@@line2[:b2],@@line3[:b3]],
			[@@line1[:c1],@@line2[:c2],@@line3[:c3]],
			[@@line1[:a1],@@line1[:b1],@@line1[:c1]],
			[@@line2[:a2],@@line2[:b2],@@line2[:c2]],
			[@@line3[:a3],@@line3[:b3],@@line3[:c3]],
			[@@line1[:a1],@@line2[:b2],@@line3[:c3]],
			[@@line3[:a3],@@line2[:b2],@@line1[:c1]]     
        ]
        winning_lines.each do |check|
            if check == x_wins || check == o_wins
                @win = true
            end

            if @@turn >= 10 
                @draw = true
            end
    end
    
    def win
        @win
    end  
    
    def draw
        @draw
    end 


end



end