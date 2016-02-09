class ProcesosController < ApplicationController
  before_action :set_proceso, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :authorize, except: [:show, :index]

  # GET /procesos
  # GET /procesos.json
  def index
    @procesos = Proceso.all.order('nombre ASC')
  end

  # GET /procesos/1
  # GET /procesos/1.json
  def show

  end

  # GET /procesos/new
  def new
    @proceso = Proceso.new
    @proceso.objetivos.build #al añadir un nuevo proceso tener la posibilidad de añadir un objetivo visional en el mismo formulario
  end

  # GET /procesos/1/edit
  def edit
    @proceso.objetivos.build #permitirá agregar un nuevo objetivo visional asociado al proceso
  end

  # POST /procesos
  # POST /procesos.json
  def create
    @proceso = current_user.procesos.build(proceso_params)

    respond_to do |format|
      if @proceso.save
        format.html { redirect_to @proceso, notice: 'Proceso creado exitosamente.' }
        format.json { render :show, status: :created, location: @proceso }
      else
        format.html { render :new }
        format.json { render json: @proceso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /procesos/1
  # PATCH/PUT /procesos/1.json
  def update
    respond_to do |format|
      if @proceso.update(proceso_params)
        format.html { redirect_to @proceso, notice: 'Proceso actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @proceso }
      else
        format.html { render :edit }
        format.json { render json: @proceso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /procesos/1
  # DELETE /procesos/1.json
  def destroy
    @proceso.destroy
    respond_to do |format|
      format.html { redirect_to procesos_url, notice: 'Proceso eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proceso
      @proceso = Proceso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proceso_params
      params.require(:proceso).permit(:nombre, :importancia, :objetivo, :meta, :fechaI, :fechaC, objetivos_attributes: [:id, :objetivoV, :_destroy])
    end

    #def authorize
     # if current_user.nil?
      #  redirect_to login_url, alert: "No estás autorizad@! Por favor inicia sesión."
      #else
       # if @proceso && @proceso.user_id != current_user
        #  redirect_to root_path, alert: "No estás autorizad@!, solo #{@proceso.user} tiene acceso a este proceso"
        #end
      #end
    #end
end