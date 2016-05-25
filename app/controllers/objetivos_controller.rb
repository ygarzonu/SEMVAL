class ObjetivosController < ApplicationController
	before_action :set_objetivo, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!

	def index
		@objetivos = Objetivo.all.order("created_at DESC")
	end

	def new
		@objetivo = Objetivo.new
		@objetivo.indicador.build
	end

	def show	
		
	end

	def edit
		@objetivo = Objetivo.find(params[:id])
	#	@indicador = @objetivo.indicador #permitirá agregar un nuevo indicador asociado al objetivo    	
  	end

  	# POST /objetivos
  	# POST /objetivos.json
  	def create
		@objetivo = Objetivo.new(objetivo_params)

	    respond_to do |format|
	      if @objetivo.save
	        format.html { redirect_to @objetivo, notice: 'objetivo creado exitosamente.' }
	        format.json { render :show, status: :created, location: @objetivo }
	      else
	        format.html { render :new }
	        format.json { render json: @objetivo.errors, status: :unprocessable_entity }
	      end
	    end
  	end

	# PATCH/PUT /objetivos/1
	# PATCH/PUT /objetivos/1.json
	def update
	    respond_to do |format|
	      if @objetivo.update(objetivo_params)
	        format.html { redirect_to @objetivo, notice: 'objetivo actualizado exitosamente.' }
	        format.json { render :show, status: :ok, location: @objetivo }
	      else
	        format.html { render :edit }
	        format.json { render json: @objetivo.errors, status: :unprocessable_entity }
	      end
	    end
	end

	# DELETE /objetivos/1
	# DELETE /objetivos/1.json
	def destroy
	    @objetivo.destroy
	    respond_to do |format|
	      format.html { redirect_to objetivos_url, notice: 'objetivo eliminado exitosamente.' }
	      format.json { head :no_content }
	    end
	end

	private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_objetivo
	      @objetivo = Objetivo.find(params[:id])
	    end

	   # Never trust parameters from the scary internet, only allow the white list through.
	    def objetivo_params
	      params.require(:objetivo).permit(:objetivoV, indicador_attributes: [:id, :variableM, :nombre, :tipo, :unidad, :sentido, :importancia, :meta, :meses, :estadoA, :peorE, :formula, :fuente, :fechaI, :fechaC, :_destroy])
	    end

end