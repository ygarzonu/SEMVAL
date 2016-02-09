class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@indicador = Indicador.find(params[:indicador_id])
		@comment = Comment.create(params[:comment].permit(:contenido))
		@comment.user_id = current_user.id
		@comment.indicador_id = @indicador.id

		if @comment.save
			redirect_to indicador_path(@indicador)
		else
			render 'new'
		end
	end

end
