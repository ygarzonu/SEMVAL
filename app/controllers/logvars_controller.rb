class LogvarsController < ApplicationController
  before_action :set_logvar, only: [:show, :edit, :update, :destroy]

  # GET /logvars
  # GET /logvars.json
  def index
    @logvars = Logvar.all
  end

  # GET /logvars/1
  # GET /logvars/1.json
  def show
  end

  # GET /logvars/new
  def new
    @logvar = Logvar.new
  end

  # GET /logvars/1/edit
  def edit
  end

  # POST /logvars
  # POST /logvars.json
  def create
    @logvar = Logvar.new(logvar_params)

    respond_to do |format|
      if @logvar.save
        format.html { redirect_to @logvar, notice: 'Logvar was successfully created.' }
        format.json { render :show, status: :created, location: @logvar }
      else
        format.html { render :new }
        format.json { render json: @logvar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logvars/1
  # PATCH/PUT /logvars/1.json
  def update
    respond_to do |format|
      if @logvar.update(logvar_params)
        format.html { redirect_to @logvar, notice: 'Logvar was successfully updated.' }
        format.json { render :show, status: :ok, location: @logvar }
      else
        format.html { render :edit }
        format.json { render json: @logvar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logvars/1
  # DELETE /logvars/1.json
  def destroy
    @logvar.destroy
    respond_to do |format|
      format.html { redirect_to logvars_url, notice: 'Logvar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logvar
      @logvar = Logvar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def logvar_params
      params.require(:logvar).permit(:valor, :fechaD, :variable_id)
    end
end
