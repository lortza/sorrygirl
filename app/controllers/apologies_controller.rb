class ApologiesController < ApplicationController
  before_action :set_apology, only: [:show, :edit, :update, :destroy]

  before_action :require_signin, except: [:show, :new, :create]

  # GET /apologies
  # GET /apologies.json
  def index
    @apologies = Apology.all
  end

  # GET /apologies/1
  # GET /apologies/1.json
  def show
  end

  # GET /apologies/new
  def new
    @apology = Apology.new
  end

  # GET /apologies/1/edit
  def edit
  end

  # POST /apologies
  # POST /apologies.json
  def create
    @apology = Apology.new(apology_params)

    respond_to do |format|
      if @apology.save
        format.html { redirect_to @apology }
        format.json { render :show, status: :created, location: @apology }
      else
        format.html { render :new }
        format.json { render json: @apology.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apologies/1
  # PATCH/PUT /apologies/1.json
  def update
    respond_to do |format|
      if @apology.update(apology_params)
        format.html { redirect_to @apology, notice: 'Apology was successfully updated.' }
        format.json { render :show, status: :ok, location: @apology }
      else
        format.html { render :edit }
        format.json { render json: @apology.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apologies/1
  # DELETE /apologies/1.json
  def destroy
    @apology.destroy
    respond_to do |format|
      format.html { redirect_to apologies_url, notice: 'Apology was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apology
      @apology = Apology.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apology_params
      params.require(:apology).permit(:body, :image)
    end
end
