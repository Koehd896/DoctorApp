class Prescription < ApplicationRecord
    belongs_to :medication
    belongs_to :doctor
    belongs_to :patient
end
