class PagesController < ApplicationController
  # layout 'admin'
  # before_action :authenticate_admin!, only: [:new, :create, :edit, :update,:destroy]
  before_action :get_page,only: [ :edit, :update,:destroy]
  skip_before_action :verify_authenticity_token

  def index
    # @pages=Page.all
    @page=Page.first
    @pages=Page.all
    @advantages=Page.first.advantages.all
    @offers=Page.first.offers.all
    @feedbacks=Page.first.feedbacks.all
    render layout: "application"
  end

  # def second
  #   @Pages=Page.all
  #   render layout: "second"
  #   # redirect_to "Pages#second"
  # end

  def new
    @page=Page.new
  end

  def create
    @page=Page.new(page_params)
    if @Page.save
      redirect_to pages_path
    else
      render :new
    end
  end

  def show
    # Comment.order('comments.impressions_count DESC').limit(5)
    @pages=Page.all

    # @pages=Page.all.order('Pages.views DESC')
    render layout: "application"
  end



  def edit

  end

  def update
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
    @page=Page.find(params[:page_id])
  end

  def page_params
    params.require(:Page).permit(:title, :name, :offer, :footer_text)
  end
end