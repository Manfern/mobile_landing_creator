class OffersController < ApplicationController
  before_action :get_page

  def index
    @offers=@page.offers
  end

  def new
    @offer=Offer.new
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
    Offer.update(params[:offers].keys, params[:offers].values)
    redirect_to pages_path
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
    params.require(:offer).permit(:name, :discount, :price, :price_old, :button_text,:id, :image, :crop_x, :crop_y, :crop_w, :crop_h)
  end
end