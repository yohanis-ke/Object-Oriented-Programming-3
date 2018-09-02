class Zombie
  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  def initialize(speed, strength)
    if speed > @@max_speed
      @speed = @@default_speed
    else
      @speed = speed
    end
    if strength > @@max_strength
      @strength = @@default_strength
    else
      @strength = strength
    end
    @total = @strength + @speed
  end

  def self.all
    @@horde
  end
  def self.new_day
    some_die_off
    spawn
    increase_plague_level
  end
  def self.some_die_off
    @@horde.shift(rand(1..10))
  end
  def self.spawn
    number_of_zombies = rand(4..10)
    number_of_zombies.times do
      zombie = Zombie.new(rand(1..5), rand(1..8))
      @@horde << zombie
    end
    # return zombie
  end
  def self.increase_plague_level

    @@plague_level += rand(3)
  end
  def self.deadliest

    total = 1000
    @@horde.each do |obj|
      if obj.total_return >= total
        return "#{obj} with #{total}"
      end
      total = obj.total_return

    end

  end

            #INSTANCE METHODS
  def encounter
    if outrun_zombie?
      return "Ran away"
    else
      if survive_attack?
        @@horde << self
        return "I'm a zombie now"
      else
        return "I'm dead"
      end

    end
  end
  def outrun_zombie?
    if rand(1..5) > @speed
      return true
    else
      return false
    end
  end
  def survive_attack?
    if rand(1..8) > @strength
      return true
    else
      return false
    end
  end
  def total_return
    @total
  end
end


puts Zombie.all.inspect # []
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5ebd0 @speed=4, @strength=0>, #<Zombie:0x005626ecc5eba8 @speed=0, @strength=4>, #<Zombie:0x005626ecc5eb80 @speed=4, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You are now a zombie
puts zombie2.encounter # You died
puts zombie3.encounter # You died
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5e1f8 @speed=0, @strength=0>, #<Zombie:0x005626ecc5e180 @speed=3, @strength=3>, #<Zombie:0x005626ecc5e158 @speed=1, @strength=2>, #<Zombie:0x005626ecc5e090 @speed=0, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You got away
puts zombie2.encounter # You are now a zombie
puts zombie3.encounter # You died

puts Zombie.deadliest
