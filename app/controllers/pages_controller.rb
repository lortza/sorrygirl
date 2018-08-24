# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :set_page, only: %i[show edit update destroy]
  before_action :require_signin, except: %i[show home]

  def home
    @page = Page.find_by!(slug: 'static-home-page')
  end

  def index
    @pages = Page.all
  end

  def show; end

  def new
    @page = Page.new
  end

  def edit; end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to @page, notice: 'Page was successfully created.'
    else
      render :new
    end
  end

  def update
    if @page.update(page_params)
      redirect_to @page, notice: 'Page was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @page.destroy
    redirect_to pages_url, notice: 'Page was successfully destroyed.'
  end

  private
    def set_page
      @page = Page.find_by!(slug: params[:id])
    end

    def page_params
      params.require(:page).permit(:name, :slug, :heading, :body, :publish_status)
    end
end
