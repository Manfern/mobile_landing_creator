class AdvantagesController < ApplicationController
  # layout 'admin'
  # before_action :authenticate_admin!, only: [:new, :create, :edit, :update,:destroy]


  def index
    # @pages=Page.all
    @advantages=Page.includes(:advantages).all
    render layout: "application"
  end

  # def second
  #   @Pages=Page.all
  #   render layout: "second"
  #   # redirect_to "Pages#second"
  # end

  def new
    @advantage=Advantage.new
  end

  def create
    @advantage=Advantage.new(advantage_params)
    if Advantage.save
      redirect_to Advantages_path
    else
      render :new
    end
  end

  def show
    # Comment.order('comments.impressions_count DESC').limit(5)
    # @params[:age]=Advantage.find(params[:id])
    @advantage=Advantage.all

    # @pages=Page.all.order('Pages.views DESC')
    render layout: "application"
  end



  def edit
    @advantage=Advantage.find(params[:id])

  end

  def update
    @advantage=Advantage.find(params[:id])
    if @advantage.update!(advantage_params)
      redirect_to advantage_path
    else
      render :edit
    end
  end



  def destroy
    @advantage=Advantage.find(params[:id])
    if @advantage.destroy
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

  def advantage_params
    params.require(:Advantage).permit(:description)
  end
end