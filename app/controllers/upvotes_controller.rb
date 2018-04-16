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

  def show
    id = params[:id]
    @upvote = Upvote.all.find(params[:id])
  end

  def create
    if !@user
      flash[:result_text] = "You must log in to do that"
      redirect_back fallback_location: :works_path
    else
      @vote = Upvote.create
      @vote.work_id = Work.find_by(id: params[:work_id]).id
      @vote.user_id = @user.id
      if @vote.save
        flash[:success] = "Successfully upvoted!"
        redirect_back fallback_location: :works_path
      else
        # flash[:alert] = @vote.errors
        # redirect_to root_path
        flash[:result_text] = "Could not upvote"
        flash[:messages] = vote.errors.messages
      end
    end
  end

  def upvote_params
    params.require(:upvote).permit(:work_id, :user_id)
  end

end
