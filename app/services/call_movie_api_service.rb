class CallMovieApiService < ApplicationService
    attr_reader :query

    def initialize(query)
        @query = query
    end

    def call
        result = nil
        url = "https://api.themoviedb.org/3/search/movie?api_key=de5e67f469bd1b23bac0a84bc98b84d9&query=#{query}"
        response = HTTParty.get(url)

        if response && response["results"] && response["results"][0]
            result = response["results"][0]["title"]
            Movie.create(title: result)
        else
            result = query
        end

        result
    end
end
