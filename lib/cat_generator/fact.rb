require 'json'

module CatGenerator
  class Fact
    CAT_FACTS_API  = 'http://catfacts-api.appspot.com/api/facts'

    def self.next
      response = Excon.get(CAT_FACTS_API)

      if response.status == 200
        json_response = JSON.parse(response.body)
        json_response["facts"].first
      end
    end
  end
end
