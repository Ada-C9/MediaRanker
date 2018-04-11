class UpvotesController < ApplicationController
  before_action :find_user
  def new
    @upvote = Upvote.new
    @upvote.user = User.find(params[:user_id])
    @upvote.work = Work.find(params[:work_id])
  end

  def index
    @user = User.find_by(id: session[:user_id] )
    if params[:work_id]
      work = Work.find_by(id: params[:work_id])
      @upvotes = user.books
    else
      @upvote = Upvote.all.order(params[:id])
    end
  end

  def show
    id = params[:id]
    @upvote = Upvote.all.find(params[:id])
  end

  def create
    @upvote = Upvote.new
    if @upvote.save
      @upvote.user_id = session[:user_id]
      @upvote.work_id = session[:work_id]
      redirect_to upvote_path(@upvote.id)
    else
      render :new
    end
  end

  def upvote_params
    params.require(:upvote).permit(:work_id, :user_id)
  end

end
