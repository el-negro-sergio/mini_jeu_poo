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
    puts "\n\nPlayer #{@name} has been killed !"
    end
  end

  def attacks(player)
    puts "Player #{@name} attacks player #{player.name}"
    @damage = compute_damage
    puts "He inflicts #{@damage} points of damage !\n\n"
    player.gets_damage(@damage)
  end

  def compute_damage
    return rand(1..6)
  end
#binding.pry
end

class HumanPlayer < Player
   attr_accessor :weapon_level

   def initialize(name)
     super(name)
     @weapon_level = 1
     @life_points = 100
   end

   def show_state
     puts "\n\n #{name} has #{life_points} points of life and a weapon level #{weapon_level}\n\n"
   end

   def compute_damage
     rand(1..6) * weapon_level
   end

   def search_weapon
     dice = rand(1..6)
     puts "You have found a level #{dice} weapon!"
     @weapon_level = dice
     if dice > weapon_level
       weapon_level = dice
       puts "Fuck yeah, this weapon is better than my current one! I will keep it \n\n"
     else
       puts "Fuck this shit! I will keep mine! \n\n"
     end
   end

   def search_health_pack
     dice = rand(1..6)
     case dice
     when 1
       "You have found nothing, John Snow"
     when 2..5
       @life_points += 50
       @life_points += 100 if life_points > 100
       puts "Fuck yeah Johnny, you have found a pack +50 life points \n\n"
     when 6
       @life_points += 80
       @life_points += 100 if life_points > 100
       puts "Fuck yeah Johnny, you have found a pack +80 life points \n\n"
     end
   end
end
