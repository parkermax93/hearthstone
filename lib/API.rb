class API 
    # make calls to our api

    def self.fetch_cards
        url = "https://rapidapi.com/omgvamp/api/hearthstone"
        uri = URI(url)
        hash = JSON.parse(response)
        response = Net::HTTP.get(uri)
        binding.pry

    end

end
