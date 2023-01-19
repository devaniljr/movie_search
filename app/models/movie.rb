class Movie < ApplicationRecord
    validates :title, presence: true, uniqueness: { case_sensitive: false }

    has_many :searches, dependent: :destroy

    searchkick
end
