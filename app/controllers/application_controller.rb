class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    
    rescue_from ActiveRecord::RecordNotFound, with: :show_errors
    private
    def show_errors
        flash[:danger] = "Sorry record not found."
        redirect_back(fallback_location: root_path)
    end
end
