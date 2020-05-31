class CLI 
    # interacts with the user 
    # any puts or get statements 
    # control the flow of our program 
    def start 
        puts "Welcome to the Mage Information Menu. Today we are looking at Mage specific cards."
        API.fetch_cards
        self.menu 
    end


    def menu 
        puts "Please select an index number for which card you would like to see."
        display_card_name
        user_input = gets.strip
        if user_input.to_f.to_i.between?(1,21)
            card_details(user_input)
        else 
            puts "Please enter an index number between 1 and 21."
            self.menu
        end
    end

    def card_details(input)
        card = Mage.all[input.to_i-1]
        # binding.pry
        puts "\nName: #{card.name} \nRarity: #{card.rarity} \nCardSet: #{card.cardSet} \nText: #{card.text}"
    end


    def  display_card_name
        sleep(1)
        Mage.all.each.with_index(1) {|card, i| puts "#{i}. #{card.name}"}
    end
end
