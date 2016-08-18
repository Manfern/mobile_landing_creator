class PagesController < ApplicationController
  # layout 'admin'
  # before_action :authenticate_admin!, only: [:new, :create, :edit, :update,:destroy]
  before_action :get_page,only: [ :show]
  before_action :add_utm_end, only: [:index, :show]
  # skip_before_action :verify_authenticity_token
  layout :resolve_layout



  def index
    if admin_signed_in?
       @page=Page.find_by(id: current_admin.selected_page)
    else
      @page=Page.first
    end
    @pages=Page.all
    @advantages=Page.first.advantages.all
    @offers=Page.first.offers.all
    @feedbacks=Page.first.feedbacks.all
    respond_to do |format|
      format.html
    end

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
    @page_id=params[:id]
    @page=Page.find(params[:id])
    @pages=Page.all
    @advantages=@page.advantages.all
    @offers=@page.offers.all
    @feedbacks=@page.feedbacks.all
    if admin_signed_in?
      current_admin.update!(selected_page: @page.id)
    end
    respond_to do |format|
      format.html
    end
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

  def add_utm_end
    # utm хвосты из текущего url присоединить к ссылке на товар\предложение
    require 'uri'
    # @uri=URI.parse(request.original_url)
    @uri=request.fullpath
    if @uri!=nil
      @uri=@uri.to_s.split('?')[1]
    else
      @uri="?utm_source=empty"
    end
    @link_params="?"+@uri
  end
end