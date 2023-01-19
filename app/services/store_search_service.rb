class StoreSearchService < ApplicationService
    attr_reader :search

    def initialize(search)
        @search = search
    end

    def call
        result = search['result']

        movie = Movie.find_by("title ILIKE ?", result)
        search_record = Search.new(title: result)
        search_record.movie = movie if movie.present?
        search_record.save

        StoreAnalyticsService.call(search)

        search_record
    end
end
