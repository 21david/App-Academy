class Dog
    def initialize(name, breed, age, bark, favorite_foods)
        @name, @breed, @age, @bark, @favorite_foods = name, breed, age, bark, favorite_foods
    end

    def name
        @name
    end

    def breed
        @breed
    end

    def age
        @age
    end

    def age=(n)
        @age = n
    end

    def bark
        if @age > 3
            @bark.upcase
        else
            @bark.downcase
        end
    end

    def favorite_foods
        @favorite_foods
    end

    def favorite_food?(food)
        @favorite_foods.each do |fav_food|
            return true if food.downcase == fav_food.downcase
        end
        false
    end
end
