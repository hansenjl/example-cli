class API

    def self.random
        url = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        result = JSON.parse(response)["drinks"][0]
        Drink.new(name: result["strDrink"], id: result["idDrink"], ingredient: "random")
    end

    def self.fetch_drinks(ingredient)
        url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        begin
            drinks = JSON.parse(response)["drinks"].each do |c|
                Drink.new(name: c["strDrink"], id: c["idDrink"], ingredient: ingredient) if c["strDrink"] != nil
            end
        rescue
             return false
        end
        # true
    end
end