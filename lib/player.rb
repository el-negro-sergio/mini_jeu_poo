require "pry"

class Player
  attr_accessor :name, :life_points


  def initialize(name, life_points = 10 )
    @name = name
    @life_points = life_points
  end

  def show_state
    return "Player #{@name} has #{@life_points} life points"
  end

  def gets_damage(damage)
    @life_points -= damage
    if @life_points <= 0
    puts "Player #{@name} has been killed !"
    end
  end

  def attacks(player)
    puts "Player #{@name} attacks player #{player.name}"
    @damage = compute_damage
    puts "He inflicts #{@damage} points of damage"
    player.gets_damage(@damage)
  end

  def compute_damage
    return rand(1..6)
  end
#binding.pry
end
