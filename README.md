* Bot Saves Princess
  Princess Peach is trapped in one of the four corners of a square grid.
  You are in the center of the grid and can move one step at a time in
  any of the four directions. Can you rescue the princess?
** Input format
   The first line contains an odd integer N (< 100) denoting the size of
   the grid. This is followed by an NxN grid. Each cell is denoted by ‘-‘
   (ascii value: 45). The bot position is denoted by ‘m’ and the princess
   position is denoted by ‘p’.

   The top left of the grid is indexed at (0,0) and the bottom right is
   indexed at (N-1,N-1)
** Output format
   Print out all the moves you take to rescue the princess in one go.
   Moves must be separated by ‘\n’ a newline. The valid outputs are LEFT
   or RIGHT or UP or DOWN.
   
   # command to run
   
     $ ruby boot_save_princess.rb

   #sample input
      Input the array index
      3

      Input row 1 values as a string like -p-
      ---

      Input row 2 values as a string like -p-
      -p- 

      Input row 3 values as a string like -p-
      m--

  #sample output

   DOWN
   
   LEFT
   

  #Task
   Complete the function displayPathtoPrincess which takes in two
   parameters - the integer N and the character array grid. The grid will
   be formatted exactly as you see it in the input, so for the sample
   input the princess is at grid ~[2][0]~. The function shall output moves
   (LEFT, RIGHT, UP or DOWN) on consecutive lines to rescue/reach the
   princess. The goal is to reach the princess in as few moves as
   possible.

   The above sample input is just to help you understand the format. The
   princess (‘p’) can be in any one of the four corners

   Scoring Your score is calculated as follows : (NxN - moves made to
   rescue the princess)/10, where N is the size of the grid (3x3 in the
   sample testcase).
* Solutions
  #Ruby
      
      
      # lib/bot_saves.rb
      #!/bin/ruby
      class BotSaves
        def find_grid(grid, character)
          element = nil
          grid.each_with_index{|arr,index| element = [index,arr.index(character)] if arr.include?(character)}
          element
        end
      
        def displayPathtoPrincess(n,grid)
          n = n.to_i
      
          unless n%2 == 1
            return "element should be odd number."
          end
      
          if n > 100
            return "element should be less than 100"
          end
      
          unless  n*n == grid.flatten.count
            return "wrong grid structure."
          end
          # find princess and boot
          princess = find_grid(grid, "p")
          boot     = find_grid(grid, "m")
      
          if princess.nil?
            return "Princess not found in Grid"
          end
      
          if boot.nil?
            return "Bot not found in Grid"
          end
      
          # negative row difference implies UP
          # negative col difference implies LEFT
          drows = princess[0] - boot[0]
          dcols = princess[1] - boot[1]
      
          moves = []
          if drows < 0
            moves << 'UP\n' * (drows.abs)
          else
            moves << 'DOWN\n' * drows
          end
      
          if dcols < 0
            moves << 'LEFT\n' * (dcols.abs)
          else
            moves << 'RIGHT\n' * dcols
          end
      
          moves.join("")
        end
      end



   #RESULTS:
    DOWN
    LEFT
    
  # Run Rsepc
    $ bundle exec rspec
    
  ## Rspec output
    .......
    
    Finished in 0.00167 seconds (files took 0.07789 seconds to load)
    7 examples, 0 failures