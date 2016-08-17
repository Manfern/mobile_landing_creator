class PagesController < ApplicationController
  # layout 'admin'
  # before_action :authenticate_admin!, only: [:new, :create, :edit, :update,:destroy]
  before_action :get_page,only: [ :show]
  # skip_before_action :verify_authenticity_token
  layout :resolve_layout
  before_action :authenticate_admin!


  def index
    @page=Page.find(params[:id])
    @pages=Page.all
    @advantages=Page.first.advantages.all
    @offers=Page.first.offers.all
    @feedbacks=Page.first.feedbacks.all
    # if params[:page][:design].present?
    #   render :redesign
    # utm хвосты из текущего url присоединить к ссылке на товар\предложение
    require 'uri'
    # @uri=URI.parse(request.original_url)
    @uri=request.fullpath
    if @uri!=nil
      @uri.to_s.split('?')[1]
    else
      @uri="?utm_source=empty"
    end
    @link_params="?"+@uri
  end

  def new
    @page=Page.new
  end

  def create
    @page=Page.new(page_params)
    # @page.page_id = params[:page_id] if params.has_key?(:page_id)
    if @page.save
      redirect_to pages_path
    else
      render :new
    end
  end

  def show
    @page=Page.find(params[:id])
    @advantages=@page.advantages.all
    @offers=@page.offers.all
    @feedbacks=@page.feedbacks.all

  end



  def edit
    @page=Page.find(params[:id])
  end

  def update
    @page=Page.find(params[:id])
    if @page.update!(page_params)
      redirect_to pages_path
    else
      render :edit
    end
  end



  def destroy
    if @page.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.
  # def set_Page
  # 	@Page = Page.find(params[:id])
  # end
  def get_page
    @page=Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :name, :offer, :footer_text, :design)
  end

  def resolve_layout
    if @page.design==3
      "page_dark"
    elsif @page.design==2
      "page_bright"
    elsif @page.design==1
      "page_normal"
    end
  end
end