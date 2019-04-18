class Game
    require_relative "player.rb"
    require_relative "board.rb"
    require_relative "couleur.rb"
    
    
    
    def initialize
        @player1 = Player.new(player_name(1))
        @player2 = Player.new(player_name(2))
        @current_player = @player2

        @selected_values = []

        @board = Board.new

        @game_on = true
        play_game
    end
    private
    def player_name(num)
        puts "HELLO, player #{num}, what is your name ?".bg_magenta.bold
        gets.chomp
    end

    def play_game
        while @game_on
            puts "     Your turn, #{@current_player.name}      ".bg_blue.bold
            cell = gets.chomp.to_sym.downcase

            while cell.match(/[^a-c1-3]/) || @selected_values.include?(cell)
                puts "WROOONG! try again".bg_red
                cell = gets.chomp.to_sym
            end
            @selected_values << cell

            @board.select(cell)
            @board.drawBoard
            @board.check_board
            if @board.win
                puts "LADIES AND GENTLEMANS the Winner is = #{@current_player.name} ! WELL DONE.".bg_cyan
                exit
            elsif @board.draw
                puts "This Match is a Tie, What a Boring Day !".bg_blue 
                exit
            end
            switch_current_player

        end   
        

    end

    def switch_current_player
        @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
    end
    
end

