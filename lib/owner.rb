require 'pry'

class Owner
  # code goes here
# buy pet
# change pet mood through walking or feeding
# sellf pet
attr_reader :name, :species
@@all = []

def initialize(name)
  @name = name
  @species = "human"
  @@all << self
end

def cats
  Cat.all.select do |cat|
    cat.owner == self
    # binding.pry
  end
end

def dogs
  Dog.all.select do |dog|
    dog.owner == self
  end
end

def buy_cat(name)
  Cat.new(name, self)
  #new cat
end

def buy_dog(name)
  Dog.new(name, self)
end

def walk_dogs
  self.dogs.map do |dog|
    dog.mood = "happy"
  end
end

def feed_cats
  self.cats.map do |cat|
    cat.mood = "happy"
  end
end

def sell_pets
  self.cats.each do |cat|
    cat.mood = "nervous"
    cat.owner = nil
  end
  self.dogs.each do |cat|
    cat.mood = "nervous"
    cat.owner = nil
    # binding.pry
  end

end

def list_pets
  "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
end

def say_species
  "I am a #{species}."
  #why @species or species?
end

def self.count
  self.all.count
  #@@all.count
end

def self.reset_all
  self.all.clear
  #@@all.clear
end

def self.all
  @@all
end

end
