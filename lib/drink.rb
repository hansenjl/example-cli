class Drink
    attr_accessor :name, :ingredient
    attr_reader :id
    @@all = []

    def initialize(name:, id:, ingredient:)
        @name = name
        @id = id
        @ingredient = ingredient
        @@all << self
    end

    def self.all
        @@all
    end

    def self.all_random_drinks
        @@all.select{|drink| drink.ingredient.downcase == "random"}
    end


    def self.all_by_ing(ing)
        @@all.select{|drink| drink.ingredient.downcase == ing.downcase}
    end
end