class AdvantagesController < ApplicationController

  # layout 'admin'
  # before_action :authenticate_admin!, only: [:new, :create, :edit, :update,:destroy]

  layout :resolve_layout
  before_action :get_page

  def index
    @advantages=@page.advantages
  end

  def new
    @advantage=Advantage.new
  end

  def create
    @advantage=Advantage.new(advantage_params)
    if @advantage.save
      redirect_to advantages_path
    else
      render :new
    end
  end

  def show
    @advantage=Advantage.all
  end

  def edit_all
    @advantages=Advantage.where(id: params[:advantage_ids])
  end

  def update_all
    @advantages=Advantage.update(params[:advantages].keys, params[:advantages].values)
    @advantages.reject! {|p| p.errors.empty? }
    if @advantages.empty?
      redirect_to pages_path
    else
      render "edit_all"
    end
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

  def get_page
    @page=Page.find(params[:page_id])
  end


  def advantage_params
    params.require(:Advantage).permit(:description)
  end

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