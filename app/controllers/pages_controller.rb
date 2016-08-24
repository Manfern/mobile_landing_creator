class PagesController < ApplicationController
  # layout 'admin'
  # before_action :authenticate_admin!, only: [:new, :create, :edit, :update,:destroy]
  before_action :get_page, only: [:preview, :show, :edit, :update]
  before_action :load_page, only: [  :index,:show, :preview]
  before_action :add_utm_end, only: [:index, :show, :preview]
  layout :resolve_layout
  # skip_before_action :verify_authenticity_token



  def index


  end

  def new
    @page=Page.new
  end

  def create
    @page=Page.new(page_params)
    if @page.save
      redirect_to page_path(@page), notice: "Страница добавлена."
    else
      render :new
    end
  end

  def show
    @page_id=params[:id]

    if admin_signed_in?
      current_admin.update!(selected_page: @page.id)
    end
    respond_to do |format|
      format.html
    end
  end

  def edit

  end

  def preview


  end

  def update
    if @page.update!(page_params)
      redirect_to page_path(@page), notice: "Страница отредактирована."
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
    if admin_signed_in?
      "application"
    else
      case @page.design
        when 1
          "layouts/_page_normal"
        when 2
          "layouts/_page_bright"
        when 3
          "layouts/_page_dark"
      end
    end
  end



  def add_utm_end
    # utm хвосты из текущего url присоединить к ссылке на товар\предложение
    require 'uri'
    # @uri=URI.parse(request.original_url)
    @uri=request.fullpath
    if @uri==nil
      @uri=@uri.to_s.split('?')[1]
    else
      @uri="utm_source=empty"
    end
    @link_params="?"+@uri
  end

  def load_page
    if admin_signed_in?
      if current_admin.selected_page.nil?
        @page=Page.first if @page.nil?
      else
        @page=Page.find_by(id: current_admin.selected_page)
      end
    else
      @page=Page.first
    end

    @pages=Page.all
    @advantages=@page.advantages.all
    @offers=@page.offers.all
    @feedbacks=@page.feedbacks.all
  end

end