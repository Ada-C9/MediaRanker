class VotesController < ApplicationController

  def new
    @vote = Vote.all
  end

  def create
    user_id = session[:logged_in_user]
    work_id = params[:work_id]
    @vote = Vote.new(user_id: user_id, work_id: work_id)

    if @vote.save
      flash[:status] = :success
      flash[:message] = "Successfully upvoted!"
      redirect_to works_path
    else

      flash[:status] = :failure
      flash[:message] = "Could not upvote.You have already voted for this work"
      redirect_to works_path
    end
  end

  private
  def vote_params
    return params.permit(:work_id)
  end
end
