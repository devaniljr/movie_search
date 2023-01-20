require 'rails_helper'

describe MovieHelper, type: :helper do
  describe "#random_poster" do
    it "returns a random poster path" do
      expect(helper.random_poster).to be_a(String)
      expect(helper.random_poster).to match(/\/img\/movie_poster_\d+\.png/)
    end
  end

  describe "#find_movie" do  
    it "finds a movie by its title" do
      movie = create(:movie, title: "The Shawshank Redemption")
      expect(helper.find_movie("The Shawshank Redemption")).to eq(movie)
    end
  end
end
