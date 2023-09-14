class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :avatar])
        devise_parameter_sanitizer.permit(:account_update, keys:[:name, :avatar])
    end
    def authorize_request(kind = nil )
        unless kind.include?(current_user.role)
            redirect_to photos_path, notice:"No estás autorizado par realizar esta accion"
        end
    end
end   