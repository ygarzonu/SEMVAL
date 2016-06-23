class LogindsController < ApplicationController
  before_action :set_logind, only: [:show, :edit, :update, :destroy]
  before_action :set_months, only: [:new,:create,:edit]

  # GET /loginds
  # GET /loginds.json
  def index
    @loginds = Logind.all
  end

  # GET /loginds/1
  # GET /loginds/1.json
  def show
  end

  # GET /loginds/new
  def new
    @logind = Logind.new 
    @indicador = Indicador.find(params[:indicador_id])
    @indicador_id = params[:indicador_id]
    @mes = params[:mes]
    @ind_est_A = @indicador.estadoA  #en _get_data.html.erb si se selecciona el mes de enero cargue este campo en la variable estadoA
    logind_estados(@indicador_id,@mes)
  end

  def logind_estados(id,num_mes)
    @estados = Logind.where(indicador_id: id, mes: num_mes).first
  end

  # GET /loginds/1/edit
  def edit
  end

  # POST /loginds
  # POST /loginds.json
  def create
    @logind = Logind.new(logind_params)
    
    respond_to do |format|
      if @logind.save
        format.html { redirect_to @logind, notice: 'El registro del indicador fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @logind }
      else
        format.html { render :new }
        format.json { render json: @logind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loginds/1
  # PATCH/PUT /loginds/1.json
  def update
    respond_to do |format|
      if @logind.update(logind_params)
        format.html { redirect_to @logind, notice: 'El registro del indicador fue actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @logind }
      else
        format.html { render :edit }
        format.json { render json: @logind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loginds/1
  # DELETE /loginds/1.json
  def destroy
    @logind.destroy
    respond_to do |format|
      format.html { redirect_to loginds_url, notice: 'El registro del indicador fue eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logind
      @logind = Logind.find(params[:id])
    end

    def set_months
      @months = {:Enero => 1, :Febrero => 2, :Marzo => 3, :Abril => 4, :Mayo => 5, :Junio => 6, :Julio => 7, :Agosto => 8, :Septiembre => 9, :Octubre => 10, :Noviembre => 11, :Diciembre => 12} 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def logind_params
      params.require(:logind).permit(:meta, :estado, :mes, :peorE, :fechaM, :fechaC, :valor, :valorP, :indicador_id)
    end
end
