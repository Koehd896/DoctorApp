class Patient < ApplicationRecord
    has_many :prescriptions
    has_many :appointments
    has_many :doctors, through: :appointmenets

    has_secure_password
end
