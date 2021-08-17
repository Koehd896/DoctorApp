class AppointmentsController < ApplicationController

    def new
        @appointment = Appointment.new(patient_id: params[:patient_id])
    end

    def create
        @appointment = Appointment.new(appointment_params)
        if @appointment.save
            redirect_to appointment_path(@appointment)
        else
            render :new
        end
    end 

    def index
        if params[:patient_id]
            @appointments = Patient.find(params[:patient_id]).appointments
        elsif params[:doctor_id]
            @appointments = Doctor.find(params[:doctor_id])
        else
            return head(:forbidden)
        end
    end

    def show
        @appointment = Appointment.find(params[:id])
    end

    private

    def appointment_params
        params.require(:appointment).permit(:date, :patient_id, :doctor_id)
    end
end