require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Welcome to 'THEY WANT MY SKIN' !"
puts "|The aim is to be the last survivor!|"
puts "-------------------------------------------------\n\n"

puts "What is your name?"
print ">"
name = gets.chomp

user = HumanPlayer.new(name)
enemies = [Player.new("Josiane"), Player.new("José")]

puts "Ready...Fight!"
while user.life_points > 0 #&& (player1.life_points > 0 || player2.life_points >0)do
user.show_state

  puts "\n Your player health is:"
  puts "#{user.show_state}"
  puts "What acction you wanna do?"
  puts "a - search for a better weapon"
  puts "s - heal"
  puts "\nAttack another player:"
  enemies.each_with_index do |enemi, i|

    enemi.life_points > 0 ? (puts "#{i} - " + enemi.show_state) : (puts "#{i} - #{enemi.name} est mort(e)")
  end
  print ">"
  choice = gets.chomp

  puts "----------------------------------------------------------"

  case choice
  when "a"
    user.search_weapon
  when "s"
    user.search_health_pack
  when "0", "1"
    enemies[choice.to_i].life_points > 0 ? user.attacks(enemies[choice.to_i])
    : (puts "You've made #{enemies[choice.to_i].name} and enemi 4 life")

  end

break if enemies.all? { |enemi| enemi.life_points <= 0 }

  puts "The other players are attacking you!"

  enemies.each do |enemi|
    enemi.attacks(user) if user.life_points > 0 && enemi.life_points > 0
  end
end

puts "You have won !"

user.life_points > 0 ? (puts "GAME OVER!") : (puts "You have lost!")
