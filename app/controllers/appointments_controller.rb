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
    end

    def show
    end

    private

    def appointment_params
        params.require(:appointment).permit(:date, :patient_id, :doctor_id)
    end
end