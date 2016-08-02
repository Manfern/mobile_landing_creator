class OffersController < ApplicationController
  def index
    @offers=Offer.all
  end

  def new
    @offer=Offer.new
  end

  def create
    @offer=Offer.create(offer_params)
    if @offer.save
      redirect_to offers_path
    end
  end

  def edit
    @offer=Offer.find(params[:id])
  end

  def show
    @offer=Offer.find(offer_params)
  end

  def update
    @offer=Offer.find(params[:id])
    if @offer.update!
        redirect_to offers_path
    else
      render :edit
    end
  end

  def destroy
    @offer=offer.find(offer_params)
    @offer.destroy
  end
  private
  def offer_params
      params.require(:offer).permit(:)
  end
end
