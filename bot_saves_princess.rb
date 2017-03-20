#!/bin/ruby
load 'lib/bot_saves.rb'
class BotSavesPrincess
  def initialize
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
    puts BotSaves.new.displayPathtoPrincess(m,grid)
  end
end

BotSavesPrincess.new