class Doctor < ApplicationRecord
    has_many :patients
    has_many :appointments
    has_many :prescriptions
    has_many :patients, through: :appointments

    has_secure_password

end
