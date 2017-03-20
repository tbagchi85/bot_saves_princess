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
