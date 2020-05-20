class CLI

    def start
        greeting
        menu
    end

    def get_drinks
        API.fetch_drinks(input)
    end

    def greeting
        puts "Welcome to your friendly bartender API!"
    end

    def menu
        puts "\n"
        puts "What would you like to see today?"

        puts "Type '1' if you would like to see a random drink recipe!"
        puts "Type '2' if you would like to search for a drink by ingredient"
        puts "Type 'exit' if you would like to exit"
        input = gets.strip
        case input
        when '1'
           random_drinks
           sleep(2)
           menu
        when '2'
            search_by_ingredient
            sleep(2)
            menu
        when 'exit'
            puts "Goodbye!"
        else
            puts "Please type a valid response."
            menu
        end
    end


    def random_drinks
        API.random
        puts "\n Here are the random drink recipes:"
        display_list_of_drinks("random")
    end

    def search_by_ingredient
        puts "Which ingredient would you like to search for?"
        ing = gets.strip
        success = API.fetch_drinks(ing)
        if success
            puts "Here are all the drinks with #{ing}"
            display_list_of_drinks(ing)
        else
            puts "Sorry! We don't have that ingredient in our system"
            search_by_ingredient
        end
    end

    def display_list_of_drinks(ing)
        Drink.all_by_ing(ing).each.with_index(1) do |drink, idx|
            puts "#{idx}. #{drink.name}"
        end
    end
end