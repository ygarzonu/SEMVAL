class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 # before_action :configure_permitted_parameters, if: :devise_controller?

   before_filter :configure_permitted_parameters, if: :devise_controller?

  
  def authenticate_lider!
		redirect_to root_path unless user_signed_in? && current_user.is_lider?
	end

	def authenticate_altaDir!
		redirect_to root_path unless user_signed_in? && current_user.is_altaDir?
	end

	def authenticate_admin!
		redirect_to root_path unless user_signed_in? &&current_user.is_admin?
	end

	protected

  		def configure_permitted_parameters
  			devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :password) }

    		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :name1, :name2, :ape1, :ape2, :email, :password, :password_confirmation, roles: []) }

    		devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :name2, :ape1, :ape2, :email, :password, :password_confirmation, :current_password) }
  		
  		end
end