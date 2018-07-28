class Vampire
 @@coven=[]

   def initialize (name, age)
     @name=name
     @age=age
     @in_coffin=true
     @drank_blood_today= true
   end

   def self.create(name, age)
    new_vampire = self.new(name, age)
      @@coven << new_vampire
     return new_vampire
   end

  def drink_blood
   @drank_blood_today = true
  end

  def self.sunrise
    @@coven.each do |a|
      if a.drank_blood_today == false || a.in_coffin== false
        @@coven.delete(a)
      end
    end
  end

  def self.sunset
    @coven.each do |a|
      a.drank_blood_today = false
      a.in_coffin = false
    end
  end

  def go_home
    @in_coffin =true
  end
end


vam1 = Vampire.create("Vam1","2")
puts vam1.inspect
puts vam1.go_home
