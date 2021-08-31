class Patient < ApplicationRecord
    has_many :prescriptions
    has_many :medications, through: :prescriptions
    has_many :appointments
    has_many :doctors, -> { distinct }, through: :appointments

    has_secure_password

    validates :name, presence: true
end
