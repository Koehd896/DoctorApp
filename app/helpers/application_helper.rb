module ApplicationHelper
    def current_user
        if session[:patient_id]
            Patient.find(session[:patient_id])
        elsif session[:doctor_id]
            Doctor.find(session[:doctor_id])
        else
            nil
        end
    end
end
