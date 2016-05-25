class IndicadorsController < ApplicationController
  before_action :set_indicador, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  # GET /indicadors
  # GET /indicadors.json
  def index
    @indicadors = Indicador.all
  end

  # GET /indicadors/1
  # GET /indicadors/1.json
  def show
   # @comments = @indicador.comments.all
    #@comment = @indicador.comments.build
   # @comments = Comment.where(indicador_id: @indicador)
  end

  # GET /indicadors/new
  def new
    @indicador = Indicador.new
    @objetivo = Objetivo.find( params[:objetivo_id])
  end

  # GET /indicadors/1/edit
  def edit
    @indicador = Indicador.find(params[:id])
    @variable = @indicador.variables.build
  end

  # POST /indicadors
  # POST /indicadors.json
  def create
    @indicador =  Indicador.new(indicador_params)
    respond_to do |format|
      if @indicador.save
        format.html { redirect_to @indicador, notice: 'El indicador fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @indicador }
      else
        format.html { render :new }
        format.json { render json: @indicador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /indicadors/1
  # PATCH/PUT /indicadors/1.json
  def update
    respond_to do |format|
      if @indicador.update(indicador_params)
      #  variable_id1 = 2
      #  variable_id2 = 1
      #  self.calcular_formula(variable_id1.to_s+" / "+variable_id2.to_s)
        format.html { redirect_to @indicador, notice: 'El indicador fue actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @indicador }
      else
        format.html { render :edit }
        format.json { render json: @indicador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indicadors/1
  # DELETE /indicadors/1.json
  def destroy
    @indicador.destroy
    respond_to do |format|
      format.html { redirect_to indicadors_url, notice: 'El indicador fue eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indicador
      @indicador = Indicador.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def indicador_params
      params.require(:indicador).permit(:objetivo_id, :variableM, :nombre, :tipo, :unidad, :sentido, :importancia, :meta, :meses, :estadoA, :peorE, :formula, :fuente, :fechaI, :fechaC, variables_attributes: [:id, :nombre, :unidad, :valorPerAnt] )
    end
end
