class Admin::SessionsController < ApplicationController
  before_action :authorize, except: [:new, :create]

  def new
  end

  def create
  	@user = User.find_by(username: params[:username]).authenticate(params[:password])
  	if @user
	  	session[:current_user_id] = @user.id
	  	redirect_to admin_users_url, notice: 'Has iniciado sesión exitosamente'
	  else
	  	flash[:alert] = 'Hay un problema con tu usuario o contraseña'
	  	rendder :new
	  end
  end

  def destroy
  end
end
