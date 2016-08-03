class OfferController < ApplicationController

  def create
    @page = Page.find(params[:page_id])
    @offer = @page.offers.create(offer_params)
    redirect_to page_path(@page)
  end

  def destroy
    @page = Page.find(params[:page_id])
    @offer = @page.offers.find(params[:id])
    @offer.destroy
    redirect_to page_path(@page)
  end

  def update
    @page = Page.find(params[:page_id])
    @offer = @page.offers.find(params[:id])

    respond_to do |format|
      if @offer.update_attributes(params[:offer])
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource offer
        format.html { redirect_to([@offer.page, @offer], :notice => 'offer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @offer.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @page = Page.find(params[:id])
    @offer = @page.offers.find(params[:id])
  end

  private
  def offer_params
    params.require(:offer).permit(:name, :discount, :price, :price_old, :button_text, :image)
  end
end