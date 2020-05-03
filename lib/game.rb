class Game
    attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
    ]

   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
   end

   def board
    @board
   end

   def current_player
    # @board.turn_count % 2 ? @player_1 : @player_2
    @board.turn_count.even? ? @player_1 : @player_2
   end

   def over?
    won? || draw?
   end

   def won?
    WIN_COMBINATIONS.detect do |combo|
            if combo.all? {|c| @board.cells[c] == "X"}
                @winner = "X"
                return combo
            elsif combo.all?{|c| @board.cells[c] == "O"}
                @winner = "O"
            return combo 
            end
        end
    nil

   end

   def draw?
    @board.full? && !won?
   end

   def winner
    won? ? board.cells[won?[0]] : nil
   end

   def turn
        input = current_player.move(board) until board.valid_move?(input)
        board.update(input, current_player)
        board.display
   end

   def play 
    while !over?
        turn
    end
    @board.display
    won? ? (puts "Congratulations #{@winner}!") : (puts "Cat's Game!")
   end

end 