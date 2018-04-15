class UpvotesController < ApplicationController
  before_action :find_user
  before_action :find_work, only: [:show, :edit, :update, :destroy]

  def create
    if !@user
      flash[:alert] = {user: "You must be logged in to vote"}
      redirect_back fallback_location: :works_path
    else
      @vote = Upvote.create
      @vote.work_id = Work.find_by(id: params[:work_id]).id
      @vote.user_id = @user.id
      if @vote.save
        flash[:success] = "Successfully upvoted!"
        redirect_back fallback_location: :works_path
      else
        flash[:alert] = @vote.errors
        redirect_to root_path
      end

    end
  end

  def upvote_params
    params.require(:upvote).permit(:work_id, :user_id)
  end

end
