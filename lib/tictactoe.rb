class TicTacToe

    def start
        puts 'LETS PLAY TICTACTOE'
        puts ' '
        puts 'MENU'
        puts ' '
        menu
    end

    def menu
        puts 'Select Option:'
        puts ' 0 - watch the computer play'
        puts ' 1 - play against the computer'
        puts ' 2 - play against a friend'
        puts ' '
        puts 'Choose a number to begin the game'
        puts 'Enter q to exit the game'
        input = gets.strip

        case(input)
        when '0'
            computer_game
        when '1'
            one_player
        when '2'
            two_player
        when 'q'
            puts 'See you again'
            exit
        else
            puts 'Invalid Selection. Try again'
            menu
        end
    end

    def computer_game
        game = Game.new
        puts 'See the computer play!'
        Game.new(Players::Computer.new('X'), Players::Computer.new('O')).play?
        new_game?
    end

    def one_player
        game = nil
        puts "Do you want to have the first turn as X?"
        puts "y or n?"
        input = gets.strip
        if input == 'y'
            game = Game.new(Players::Human.new('X'), Players::Computer.new('O'))
        elsif selection == 'n'
            game = Game.new(Players::Computer.new('X'), Players::Human.new('O'))
        else
            puts 'Invalid Input. Please try again'
            input = gets.strip
        end
        game.play
        new_game?
    end 

    def two_player
        game = nil
        puts 'Lets start the 2 player TicTacToe game. Good Luck!'
        puts ' '
        game = Game.new
        game.board.display
        game.play
        new_game?
    end

    def new_game?
        puts 'Do you want to start a new game? y or n ?'
        input = gets.strip.downcase
        if input == 'y'
            menu
        else
            puts 'Thank you for playing! See you!!!'
            exit
        end
    end


end