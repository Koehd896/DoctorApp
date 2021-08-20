class PrescriptionsController < ApplicationController

    def new
        @prescription = Prescription.new(doctor_id: params[:doctor_id])
    end

    def create
        @prescription = Prescription.create(prescription_params)
        redirect_to prescription_path(@prescription)  
    end

    def show
        @prescription = Prescription.find(params[:id])
    end

    def index
        if params[:patient_id]
            @prescriptions = Patient.find(params[:patient_id]).prescriptions
        elsif params[:doctor_id]
            @prescriptions = Doctor.find(params[:doctor_id]).prescriptions
        else
            return head(:forbidden)
        end
    end

    private

    def prescription_params
        params.require(:prescription).permit(:doctor_id, :patient_id, :medication_id)
    end

    
end