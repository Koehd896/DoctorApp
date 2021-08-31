class PatientsController < ApplicationController
    def new
        @patient = Patient.new
    end

    def create
        @patient = Patient.new(patient_params)
        if @patient.save
            session[:patient_id] = @patient.id
            redirect_to patient_path(@patient)
        else
            render :new
        end
    end

    def show
        # check that patient is logged in
        @patient = Patient.find(params[:id])
    end

    def login
        @patient = Patient.new
    end


    private

    def patient_params
        params.require(:patient).permit(:name, :password, :password_confirmation)
    end
end