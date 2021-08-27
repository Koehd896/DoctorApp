class MedicationsController < ApplicationController
    def index
        @medications = Patient.find(params[:patient_id]).medications.uniq
    end
end