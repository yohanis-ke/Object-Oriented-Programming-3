class Zombie
 @@horde=[]
 @@plague_level=10
 @@max_speed=5
 @@max_strength=8
 @@default_speed=1
 @@default_strength=3

 def initialize(speed , strength)
   if speed > @@max_speed
      @@max_speed = @@default_speed
   if strength <= @@max_strength
      @@max_strength= @@default_strength
   end
 end
 end
 #
 # end

 # def encounter
 # end
 #
 # def outrun_zombie?
 # end
 #
 # def survive_attack?
 # end
 #
 def self.all
   return @@horde
 end
 #
 # def self.new_day
 # end
 #
 def some_die_off
   return @@horde[rand(@@horde.length)]
 end
 #
 def spawn
   number=rand(@@plague_level)
   number.times{@@horde.push(self.new)}
   return @@horde
 end
 #
 # def increase_plague_level
 # end


end


puts Zombie.all.inspect
