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
