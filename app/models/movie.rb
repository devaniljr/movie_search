class Movie < ApplicationRecord
    validates :title, presence: true, uniqueness: { case_sensitive: false }

    searchkick
end
