class VotesController < ApplicationController

  def create
    # if user id exists
    if session[:user_id]
      new_vote = {
        user_id: session[:user_id],
        work_id: params[:work_id]
      }
      @vote = Vote.new(new_vote)
      if  @vote.save
        flash[:notice] = "Successfully Upvoted!"
      else
        flash[:alert] = "Unable to Upvote!"
        flash[:notice] = @vote.errors.full_messages
      end
    else
      flash[:notice] = "You must be logged in to do that!"
    end
    redirect_to request.referer
  end

end
