class FeedbacksController < ApplicationController
  before_action :get_page
  layout :resolve_layout



  def index
    @feedbacks=@page.feedbacks
  end

  def new
    @feedback=Feedback.new

  end

  def show
    @feedback=Feedback.find(params[:id])
  end

  def create
    @feedback = @page.feedbacks.new(feedback_params)
    if @feedback.save
        redirect_to pages_path(@page), notice: "Отзыв добавлен."
    else
      render :new
    end
  end

  def edit_all
    @feedbacks=Feedback.where(id: params[:feedback_ids])
  end

  def update_all
    @feedbacks=Feedback.update(params[:feedbacks].keys, params[:feedbacks].values)
    @feedbacks.reject! {|p| p.errors.empty? }
    if @feedbacks.empty?
      redirect_to pages_path
    else
      render "edit_all"
    end
  end


  def destroy
    @feedback = @page.feedbacks.find(params[:id])
    @feedback.destroy
    redirect_to pages_path(@page)
  end

  def update
    @feedback = @page.feedbacks.find(params[:id])
    if @feedback.update(feedback_params)
        redirect_to page_path(@page), notice: "Предложение отредактировано."
    else
      render :edit
    end
  end

  def edit
    @feedback = @page.feedbacks.find(params[:id])
  end


  private

  def get_page
    @page=Page.find(params[:page_id])
  end

  def feedback_params
    params.require(:feedback).permit(:description, :author, :photo)
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
end