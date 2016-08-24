class PagesController < ApplicationController
  # layout 'admin'
  # before_action :authenticate_admin!, only: [:new, :create, :edit, :update,:destroy]
  before_action :get_page, only: [:preview, :show, :edit, :update]
  before_action :load_page, only: [:index, :show, :preview]
  before_action :add_utm_end, only: [:index, :show, :preview]
  layout :resolve_layout, except: [:preview]
  layout :resolve_preview_layout, only: [:preview]
  # skip_before_action :verify_authenticity_token




  def index
    if admin_signed_in?
       if current_admin.selected_page.nil?
          @page=Page.first if @page.nil?
       else
         @page=Page.find_by(id: current_admin.selected_page)
       end
    else
      @page=Page.first
    end

    # respond_to do |format|
    #   format.html
    # end

  end

  def new
    @page=Page.new
  end

  def create
    @page=Page.new(page_params)
    # @page.page_id = params[:page_id] if params.has_key?(:page_id)
    if @page.save
      redirect_to page_path(@page), notice: "Страница добавлена."
    else
      render :new
    end
  end

  def show
    @page_id=params[:id]
    # @page=Page.find(params[:id])
    # @pages=Page.all
    # @advantages=@page.advantages.all
    # @offers=@page.offers.all
    # @feedbacks=@page.feedbacks.all
    if admin_signed_in?
      current_admin.update!(selected_page: @page.id)
    end
    respond_to do |format|
      format.html
    end
  end

  def edit
    # @page=Page.find(params[:id])
  end

  def preview
    # @page=Page.find(params[:id])

  end

  def update
    # @page=Page.find(params[:id])
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
          "page_normal"
        when 2
          "page_bright"
        when 3
          "page_dark"
      end
    end
  end
  def resolve_preview_layout
    case @page.design
      when 1
        "page_normal"
      when 2
        "page_bright"
      when 3
        "page_dark"
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
    @pages=Page.all
    @advantages=Page.first.advantages.all
    @offers=Page.first.offers.all
    @feedbacks=Page.first.feedbacks.all
  end
end