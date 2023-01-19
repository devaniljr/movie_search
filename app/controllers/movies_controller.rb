require 'securerandom'

class MoviesController < ApplicationController
    before_action :set_search_id, only: :index

    def index
        if params[:query].present?
            @movies = Movie.search(params[:query])

            CachingSearchService.call(session[:search_id],
                                      params[:query],
                                      @movies&.first&.title)
        else
            @movies = Movie.all.sample(4)
        end
    end

private

    def set_search_id
        if session[:search_id].blank? || params[:query].blank?
            session[:search_id] = SecureRandom.hex(10)
        end
    end
end
