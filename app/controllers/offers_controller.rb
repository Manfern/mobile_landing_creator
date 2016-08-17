class OffersController < ApplicationController
  layout :resolve_layout

  before_action :get_page

  def index
    @offers=@page.offers
  end

  def new
    @offer=Offer.new(link: "http://", button_text:"Перейти в корзину", discount:"50")

  end

  def show
    @offer=Offer.find(params[:id])
  end

  def create
    @offer = @page.offers.new(offer_params)
    if @offer.save
      if params[:offer][:image].present?
        render :crop
      else
        redirect_to pages_path(@page), notice: "Предложение добавлено."
      end
    else
      render :new
    end
  end

  def edit_all
    @offers=Offer.where(id: params[:offer_ids])
  end

  def update_all
    @offers=Offer.update(params[:offers].keys, params[:offers].values)
    @offers.reject! {|p| p.errors.empty? }
    if @offers.empty?
      redirect_to pages_path
    else
      render "edit_all"
    end

  end

  def crop
    @offer = @page.offers.find(params[:id])

  end

  def destroy
    @offer = @page.offers.find(params[:id])
    @offer.destroy
    redirect_to pages_path(@page)
  end

  def update
    @offer = @page.offers.find(params[:id])
    if @offer.update(offer_params)
      if params[:offer][:image].present?
        render :crop
      else
        redirect_to page_path(@page), notice: "Предложение отредактировано."
      end
    else
      render :edit
    end
  end

  def edit
    @offer = @page.offers.find(params[:id])
  end


  private

  def get_page
    @page=Page.find(params[:page_id])
  end

  def offer_params
    params.require(:offer).permit(:name, :discount, :price, :price_old, :button_text,:link, :image)
  end
  # , :crop_x, :crop_y, :crop_w, :crop_
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