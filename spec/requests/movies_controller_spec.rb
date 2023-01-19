require 'rails_helper'

RSpec.describe MoviesController, type: :request do
  describe "GET #index" do
    context "when query parameter is present" do
      it "returns movies matching the query" do
        movie1 = create(:movie, :reindex, title: "Superman")
        movie2 = create(:movie, :reindex, title: "Batman")
        Movie.search_index.refresh

        get "/movies?query=Superman"

        expect(response).to have_http_status(200)
        expect(response.body).to include("Superman")
        expect(response.body).not_to include("Batman")
      end
    end
    
    context "when query parameter is not present" do
      it "returns a sample of 4 movies" do
        movie1 = create(:movie, title: "Superman")
        movie2 = create(:movie, title: "Batman")
        movie3 = create(:movie, title: "Wonder Woman")
        movie4 = create(:movie, title: "Aquaman")

        get "/movies"

        expect(response).to have_http_status(200)
        expect(response.body).to include(movie1.title)
        expect(response.body).to include(movie2.title)
        expect(response.body).to include(movie3.title)
        expect(response.body).to include(movie4.title)      
      end
    end
  end
end
