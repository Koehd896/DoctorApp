class PatientsController < ApplicationController
    def new
        @patient = Patient.new
    end

    def create
        @patient = Patient.create(patient_params)
        redirect_to patient_path(@patient)
    end


    private

    def patient_params
        params.require(:patient).permit(:name, :password, :password_confirmation)
    end
end