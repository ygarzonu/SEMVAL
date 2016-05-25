class Admin::UsersController < ApplicationController
	def index
		@users = User.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "Usuario actualizado exitosamente"
			redirect_to admin_users_url
		else
			flash[:alert] = "Hay un problema actualizando el usuario"
			render 'edit'
		end
	end

	private

	def user_params
		params.require(:user).permit(:id, :name1, :ape1, :username, :email)
	end
end