class Doctor < ApplicationRecord
    has_many :appointments
    has_many :prescriptions
    has_many :patients, -> { distinct }, through: :appointments

    has_secure_password

    validates :name, presence: true

end
