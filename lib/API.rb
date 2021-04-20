class API 
    # make calls to our api

    def self.fetch_cards
        url = URI("https://omgvamp-hearthstone-v1.p.rapidapi.com/cards/classes/Mage?collectible=1&cost=1")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = 'omgvamp-hearthstone-v1.p.rapidapi.com'
        request["x-rapidapi-key"] = '9fb1a5de00msh63f9cb0a8189569p17bed3jsn6e919e7f5c43'
        response = http.request(request)
        hash = JSON.parse(response.read_body)
        #binding.pry
        # creating each card from our api
        array_of_cards = hash
        array_of_cards.each do |card_hash|
            card_instance = Mage.new 
            card_instance.cost = card_hash["cost"]
            card_instance.name = card_hash["name"]
            card_instance.cardSet = card_hash["cardSet"]
            card_instance.text = card_hash["text"].tr('$', "").tr('<b>', "").tr('/', "").tr('/\n', "")
            card_instance.rarity = card_hash["rarity"]
        end
    end



end
