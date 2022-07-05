class Organization < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: { within: 1..30 }
    validates :hourly_rate, presence: true

    has_many :users
end
