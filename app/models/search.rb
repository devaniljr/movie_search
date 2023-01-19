class Search < ApplicationRecord
  belongs_to :movie, optional: true

  def self.most_searched
    group(:title).count.sort_by { |_, v| -v }.to_h
  end
end
