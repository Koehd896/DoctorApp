class DoctorsController < ApplicationController
    def new
        @doctor = Doctor.new
    end

    def create
        @doctor = Doctor.new(doctor_params)
        if @doctor.save
            session[:doctor_id] = @doctor.id
            redirect_to doctor_path(@doctor)
        else
            render :new
        end
    end

    def login
        @doctor = Doctor.new
    end

    def show
        @doctor = Doctor.find(params[:id])
    end

    private

    def doctor_params
        params.require(:doctor).permit(:name, :password, :password_confirmation)
    end
end
