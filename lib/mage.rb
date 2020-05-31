class Mage

   attr_accessor :cost, :name, :cardSet, :text, :rarity
    
    @@all = [] 
    @@selection = []

    def initialize()
        @@all << self
    end

    def self.all 
        @@all
    end

    def self.selection
        @@selection 
    end

    def self.search_cards(input)
        cost_selection = self.all.select {|m| m.cost = input}
        @@selection << cost_selection 
        puts @@selection
    end



end
