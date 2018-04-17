class UpvotesController < ApplicationController
  before_action :find_user
  before_action :find_work, only: [:show, :edit, :update, :destroy]

  # def new(current_work.id)
  #   # user_id = session[:user_id]
  #   @upvote = Upvote.new
  #   # @upvote.current_user = User.find(session[:user_id])
  #   @upvote.work_id = current_work.id
  # end

  # def index
  #   @user = User.find_by(id: session[:user_id] )
  #   if params[:work_id]
  #     work = Work.find_by(id: params[:work_id])
  #     @upvotes = user.books
  #   else
  #     @upvote = Upvote.all.order(params[:id])
  #   end
  # end

  # def show
  #   id = params[:id]
  #   @upvote = Upvote.all.find(params[:id])
  # end

  def create
    if !@current_user
      flash[:alert] = {user: "You must be logged in to vote"}
    else
      @upvote = Upvote.new
      @upvote.work_id = Work.find_by(id: params[:work_id]).id
      @upvote.user_id = @current_user.id
      if @upvote.save
        flash[:success] = "Successfully upvoted!"
      else
        flash[:alert] = @upvote.errors
      end

    end
    redirect_back fallback_location: :works_path
  end

  def upvote_params
    params.require(:upvote).permit(:work_id, :user_id)
  end

end
