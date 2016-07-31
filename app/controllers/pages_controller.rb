class PagesController < ApplicationController
  # layout 'admin'
  # before_action :authenticate_admin!, only: [:new, :create, :edit, :update,:destroy]
  

  def index
    # @pages=Page.all
    @pages=Page.all
    @page=Page.last
    # render layout: "application"
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
    # if @Page.save
    #   redirect_to Pages_path
    # else
    #   render :new
    # end
  end

  def show
    # Comment.order('comments.impressions_count DESC').limit(5)
    @page=Page.find(params[:id])
    @pages=Page.all

    # @pages=Page.all.order('Pages.views DESC')
    render layout: "application"
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
    @page=Page.find(params[:id])
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

  def page_params
    params.require(:Page).permit(:title, :content, :image)
  end
end