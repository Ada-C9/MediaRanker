class VotesController < ApplicationController

  def new
    @vote = Vote.all
  end

  def create
    #   @vote = Vote.new(user_id: session[:user_id])
    #
    #   if @vote.save
    #     flash[:status] = :success
    #     flash[:message] = "Successfully created work #{@vote.id}"
    #     redirect_to works_path
    #   else
    #     # Tell user what went wrong
    #     flash[:status] = :failure
    #     flash[:message] = "Could not upvote. User: has already voted for this work"
    #     flash[:details] = @vote.errors.messages
    #     redirect_to works_path
    #   end
    # end
    user_id = session[:logged_in_user]
    work_id = params[:id]
    @vote = Vote.new(user_id: user_id, work_id: work_id)

    if @vote.save
      flash[:status] = :success
      flash[:message] = "Successfully upvoted!"
      redirect_back(fallback_location: root_path)
    else
      if @vote.user_id ==  nil
        flash[:message] = "You must loggin to do that"
      else
        flash[:status] = :failure
        flash[:message] = "Could not upvote.You have already voted for this work"
      end
    end
    redirect_back(fallback_location: root_path)
  end

  private
  def vote_params
    return params.permit(:work_id)
  end
end
