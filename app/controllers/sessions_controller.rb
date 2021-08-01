class SessionsController < ApplicationController
    def create
        if @patient = Patient.find_by(id: params[:patient_id])
            if @patient.authenticate(params[:password])
                session[:patient_id] = @patient.id
                redirect_to patient_path(@patient)
            else
                flash[:notice] = "login failed"
                render '/sessions/new'
            end
        else
            @doctor = Doctor.find_by(id: params[:doctor_id])
            if @doctor.authenticate(params[:password])
                session[:doctor_id] = @doctor.id
                redirect_to doctor_path(@doctor)
            else
                flash[:notice] = "login failed"
                render '/sessions/new'
            end
        end
    end
end