# frozen_string_literal: true

class ApologiesController < ApplicationController
  before_action :set_apology, only: %i[show edit update destroy]
  before_action :require_signin, except: %i[show new create]

  def index
    @apologies = Apology.ordered
  end

  def show; end

  def new
    @apology = Apology.new
  end

  def edit; end

  def create
    @apology = Apology.new(apology_params)

    if @apology.save
      redirect_to @apology, flash: { social_media_share: 'Send via Social Media' }
    else
      flash.now[:alert] = 'Something went wrong. Ryan apologizes for that.'
      render :new
    end
  end

  def update
    if @apology.update(apology_params)
      redirect_to @apology, notice: message(@apology, 'updated')
    else
      render :edit
    end
  end

  def destroy
    @apology.destroy
    redirect_to apologies_url, notice: message(@apology, 'deleted')
  end

  private

  def message(apology, action)
    "#{apology.class.name} was successfully #{action}."
  end

  def set_apology
    @apology = Apology.find(params[:id])
  end

  def apology_params
    params.require(:apology).permit(:body, :image)
  end
end
