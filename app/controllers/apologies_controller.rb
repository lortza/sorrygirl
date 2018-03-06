class ApologiesController < ApplicationController
  before_action :set_apology, only: [:show, :edit, :update, :destroy]

  before_action :require_signin, except: [:show, :new, :create]

  def index
    @apologies = Apology.all.order("created_at DESC")
  end

  def show
  end

  def new
    @apology = Apology.new
  end

  def edit
  end

  def create
    @apology = Apology.new(apology_params)

    if @apology.save
      redirect_to @apology
    else
      render :new
    end
  end

  def update
    if @apology.update(apology_params)
      redirect_to @apology, notice: 'Apology was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @apology.destroy
      redirect_to apologies_url, notice: 'Apology was successfully destroyed.'
  end

  private
    def set_apology
      @apology = Apology.find(params[:id])
    end

    def apology_params
      params.require(:apology).permit(:body, :image)
    end
end
