class Tictactoe

  def initialize

    @player1 = Player.new "Player1", "X"
    @player2 = Player.new "Player2", "O"
    @board = Board.new
    display_rules
    loop
  end

  def display_rules
    puts "Welcome to TIC TAC TOE"
    puts "to play you must insert the position as follows:"
    puts "x, y"
  end

  def loop

    players = [@player1, @player2]
    current = 0
    winner = false

    while !winner do
        @board.display_board
        puts players[current].name + " turn:"
        position = gets.chomp.delete(' ').split(',')
        @board.play position[0], position[1], players[current]

        winner = @board.check_win players[current]
        if current == 0
          current = 1
        else
          current = 0
        end
      end
    end

  end

  class Board

    def initialize
      @board = Hash.new(" ")
    end

    def play x, y, player

      @board["#{x}#{y}"] = player.symbol if @board["#{x}#{y}"] == " "

    end

    def display_board
      puts @board["00"] + "|" + @board["01"] + "|" + @board["02"]
      puts @board["10"] + "|" + @board["11"] + "|" + @board["12"]
      puts @board["20"] + "|" + @board["21"] + "|" + @board["22"]
    end


    def check_win player

      if  @board["00"] + @board["01"] + @board["02"] == player.symbol * 3 ||
          @board["10"] + @board["11"] + @board["12"] == player.symbol * 3 ||
          @board["20"] + @board["21"] + @board["22"] == player.symbol * 3 ||

          @board["00"] + @board["10"] + @board["20"] == player.symbol * 3 ||
          @board["01"] + @board["11"] + @board["21"] == player.symbol * 3 ||
          @board["02"] + @board["12"] + @board["22"] == player.symbol * 3 ||

          @board["00"] + @board["11"] + @board["22"] == player.symbol * 3 ||
          @board["02"] + @board["11"] + @board["02"] == player.symbol * 3
        puts player.name + "Won!!!"
        true
      else
        false
      end
    end
  end

  class Player

    attr_reader :name, :symbol

    def initialize name, symbol
      @name = name
      @symbol = symbol
    end
  end

  game = Tictactoe.new
