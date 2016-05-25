class CommentsController < ApplicationController
	

	def create
		@indicador = Indicador.find(params[:indicador_id])
		@comment = @indicador.comments.create(params[:contenido].permit(:contenido))
		

		if @comment.save
			redirect_to indicador_path(@indicador)
		else
			render 'nuevo'
		end
	end

end
