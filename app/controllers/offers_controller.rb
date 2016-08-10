class OffersController < ApplicationController
  before_action :get_page

  def index
    @offers=@page.offers
  end

  def new
    @offer=Offer.new
  end

  def create
    @offer = @page.offers.create(offer_params)
    redirect_to pages_path(@page)
  end

  def edit_all
    @offers=Offer.where(id: params[:offer_ids])
  end

  # @offers=Offer.find(params[:offer_ids])
  # @offers=@page.offers
  # @offers=Offer.find(params[:offer_ids])
  def update_all
    Offer.update(params[:offers].keys, params[:offers].values)
    redirect_to pages_path
  end

  def destroy
    @offer = @page.offers.find(params[:id])
    @offer.destroy
    redirect_to pages_path(@page)
  end

  def update
    @offer = @page.offers.find(params[:id])

    respond_to do |format|
      if @offer.update!(offer_params)
        if params[:offer][:image].present?
          #1st argument of redirect_to is an array, in order to build the correct route to the nested resource offer
          format.html {
            # redirect_to([@offer.page, @offer], :notice => 'offer was successfully updated.')
            redirect_to pages_path
          }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @offer.errors, :status => :unprocessable_entity }
        end
      end
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
    params.require(:offer).permit(:name, :discount, :price, :price_old, :button_text,:id, :image)
  end
end