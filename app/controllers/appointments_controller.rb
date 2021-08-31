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
            if params[:filter] == 'Upcoming'
                @appointments = Patient.find(params[:patient_id]).appointments.upcoming
            elsif params[:filter] == 'Completed'
                @appointments = Patient.find(params[:patient_id]).appointments.completed
            else
                @appointments = Patient.find(params[:patient_id]).appointments
            end
        elsif params[:doctor_id]
            if params[:filter] == 'Upcoming'
                @appointments = Doctor.find(params[:doctor_id]).appointments.upcoming
            elsif params[:filter] == "Completed"
                @appointments = Doctor.find(params[:doctor_id]).appointments.completed
            else
                @appointments = Doctor.find(params[:doctor_id]).appointments
            end
        else
            return head(:forbidden)
        end
    end

    def show
        # check that appointment belongs to current user 
        @appointment = Appointment.find(params[:id])
    end

    private

    def appointment_params
        params.require(:appointment).permit(:date, :patient_id, :doctor_id)
    end
end