class DoctorsController < ApplicationController
    def new
        @doctor = Doctor.new
    end

    def create
        @doctor = Doctor.create(doctor_params)
        redirect_to doctor_path(@doctor)
    end

    private

    def doctor_params
        params.require(:doctor).permit(:name, :password, :password_confirmation)
    end
end
