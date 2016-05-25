class Admin::ApplicationController < ApplicationController
	before_action :authorize

	def current_user
		@user ||= User.find(session[:current_user_permission_level]) if session[:current_user_permission_level]
	end

	def authorize
		unless current_user
			redirect_to '/login', alert: 'Por favor inicia sesión para ver las paginas de administración'	
		end
	end