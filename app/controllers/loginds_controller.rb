class LogindsController < ApplicationController
  before_action :set_logind, only: [:show, :edit, :update, :destroy]

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
    @estados = {
      "01" => Logind.where(indicador_id: @indicador_id, mes: 1).first.estado,
      "02" => Logind.where(indicador_id: @indicador_id, mes: 2).first.estado,
      "03" => Logind.where(indicador_id: @indicador_id, mes: 3).first.estado,
      "04" => Logind.where(indicador_id: @indicador_id, mes: 4).first.estado,
      "05" => Logind.where(indicador_id: @indicador_id, mes: 5).first.estado,
      "06" => Logind.where(indicador_id: @indicador_id, mes: 6).first.estado,
      "07" => Logind.where(indicador_id: @indicador_id, mes: 7).first.estado,
      "08" => Logind.where(indicador_id: @indicador_id, mes: 8).first.estado,
      "09" => Logind.where(indicador_id: @indicador_id, mes: 9).first.estado,
      "10" => Logind.where(indicador_id: @indicador_id, mes: 10).first.estado,
      "11" => Logind.where(indicador_id: @indicador_id, mes: 11).first.estado,
      "12" => Logind.where(indicador_id: @indicador_id, mes: 12).first.estado
    }
    p "_"*100
    p @estados
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def logind_params
      params.require(:logind).permit(:meta, :estado, :mes, :peorE, :fechaM, :fechaC, :valor, :valorP, :indicador_id)
    end
end
