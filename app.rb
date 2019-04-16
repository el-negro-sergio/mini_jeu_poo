require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

player1 = Player.new("Josiane")
player2 = Player.new("José")

while player1.life_points > 0 && player2.life_points > 0 do
  puts 'Here is the state of each player'
  puts player1.show_state
  puts player2.show_state


  puts "Lets move to the attack phase"
  puts player1.attacks(player2)
  if player2.life_points <= 0
    break
  end
  puts player2.attacks(player1)
end
