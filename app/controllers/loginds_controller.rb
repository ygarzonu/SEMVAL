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
        format.html { redirect_to @logind, notice: 'Logind was successfully created.' }
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
        format.html { redirect_to @logind, notice: 'Logind was successfully updated.' }
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
      format.html { redirect_to loginds_url, notice: 'Logind was successfully destroyed.' }
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
      params.require(:logind).permit(:meta, :estado, :peorE, :fechaM, :fechaC, :valor, :valorP, :indicador_id)
    end
end
