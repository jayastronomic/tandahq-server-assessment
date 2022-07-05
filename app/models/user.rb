class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true, length: { within: 1..15 }, uniqueness: true
    validates :email_address, presence: true, uniqueness: true
    validates_format_of :email_address, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    belongs_to :organization, optional: true
    has_many :shifts, dependent: :destroy

end
