class SessionsController < ApplicationController

    def patient_login
        @patient = Patient.new
    end

    def doctor_login
        @doctor = Doctor.new
    end
    
    def create
        # byebug
        if params['provider']
            @patient = Patient.find_or_create_by(name: auth_hash['info']['nickname'])
            session[:patient_id] = @patient.id
            redirect_to patient_path(@patient)
        elsif params[:patient]
            @patient = Patient.find_by(name: params[:patient][:name])
            if @patient.authenticate(params[:patient][:password])
                session[:patient_id] = @patient.id
                redirect_to patient_path(@patient)
            else
                flash[:notice] = "login failed"
                render '/sessions/patient_login'
            end
        else
            @doctor = Doctor.find_by(name: params[:doctor][:name])
            if @doctor.authenticate(params[:password])
                session[:doctor_id] = @doctor.id
                redirect_to doctor_path(@doctor)
            else
                flash[:notice] = "login failed"
                render '/sessions/doctor_login'
            end
        end
    end

    def destroy
        session.delete :patient_id
        session.delete :doctor_id
        redirect_to '/'
    end

    protected

    def auth_hash
      request.env['omniauth.auth']
    end

end