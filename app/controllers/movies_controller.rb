class MoviesController < ApplicationController
    def index
        if params[:query].present?
            @movies = Movie.search(params[:query])
        else
            @movies = Movie.all.sample(4)
        end
    end
end
