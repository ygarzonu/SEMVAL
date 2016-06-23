class Admin::UsersController < ApplicationController
	def index
		@users = User.all
		@process_count = User.includes(:procesos).group("procesos.user_id").pluck("users.name1, count(procesos.id)")
		#@process_count = Proceso.group(:user_id).count
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