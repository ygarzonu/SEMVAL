class LogprosController < ApplicationController
  before_action :set_logpro, only: [:show, :edit, :update, :destroy]

  # GET /logpros
  # GET /logpros.json
  def index
    @logpros = Logpro.all
  end

  # GET /logpros/1
  # GET /logpros/1.json
  def show
  end

  # GET /logpros/new
  def new
    @logpro = Logpro.new
  end

  # GET /logpros/1/edit
  def edit
  end

  # POST /logpros
  # POST /logpros.json
  def create
    @logpro = Logpro.new(logpro_params)

    respond_to do |format|
      if @logpro.save
        format.html { redirect_to @logpro, notice: 'Logpro was successfully created.' }
        format.json { render :show, status: :created, location: @logpro }
      else
        format.html { render :new }
        format.json { render json: @logpro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logpros/1
  # PATCH/PUT /logpros/1.json
  def update
    respond_to do |format|
      if @logpro.update(logpro_params)
        format.html { redirect_to @logpro, notice: 'Logpro was successfully updated.' }
        format.json { render :show, status: :ok, location: @logpro }
      else
        format.html { render :edit }
        format.json { render json: @logpro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logpros/1
  # DELETE /logpros/1.json
  def destroy
    @logpro.destroy
    respond_to do |format|
      format.html { redirect_to logpros_url, notice: 'Logpro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logpro
      @logpro = Logpro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def logpro_params
      params.require(:logpro).permit(:meta, :estado, :peorE, :fechaM, :fechaC, :valor, :valorP, :proceso_id)
    end
end
