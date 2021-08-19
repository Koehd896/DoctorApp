class Appointment < ApplicationRecord
    belongs_to :doctor
    belongs_to :patient

    validates :date, presence: true

    scope :upcoming, -> { where("date > ?", "DateTime.now") }
    scope :completed, -> { where("date < ?", "DateTime.now") }

end
