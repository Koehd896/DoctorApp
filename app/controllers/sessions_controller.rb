class SessionsController < ApplicationController
    
    def create
        # byebug
        if @patient = Patient.find_by(name: params[:patient][:name])
            if @patient.authenticate(params[:patient][:password])
                session[:patient_id] = @patient.id
                redirect_to patient_path(@patient)
            else
                flash[:notice] = "login failed"
                render '/patients/login'
            end
        else
            @doctor = Doctor.find_by(id: params[:doctor_id])
            if @doctor.authenticate(params[:password])
                session[:doctor_id] = @doctor.id
                redirect_to doctor_path(@doctor)
            else
                flash[:notice] = "login failed"
                render '/doctors/login'
            end
        end
    end

    def destroy
        session.delete :patient_id
        session.delete :doctor_id
        redirect_to '/'
    end
end