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
   
      #!/bin/ruby
     
      def find_grid(grid, character)
        grid.each_with_index{|arr,index| return [index,arr.index(character)] if arr.include?(character)}
      end 
     
      def displayPathtoPrincess(n,grid)
       # find princess and boot
       princess = find_grid(grid, "p")
       boot     = find_grid(grid, "m")
     
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
     
       return moves.join("")
      end
     
      puts "Input the array index"
      m = gets.strip.to_i
     
      grid = Array.new(m)
     
      (0...m).each do |i|
         puts "Input row #{i+1} values as a string like -p-"
         values = gets.strip.split("")
         if values.count == m.to_i
           grid[i] = values
         else
           abort("Your input count is not same for total array index #{m}")
         end
      end
     
      puts displayPathtoPrincess(m,grid)


   #RESULTS:
    DOWN
    LEFT