class VotesController < ApplicationController
  def create
    if session[:user_id]
      new_vote = {
        user_id: session[:user_id],
        work_id: params[:work_id]
      }
      @vote = Vote.new(new_vote)

      if @vote.save
        flash[:success] = "You voted!"
        redirect_to works_path
      else
        flash[:alert] = "Vote did not save"
        redirect_to works_path
      end

    else
      flash[:alert] = "You must be logged in to do this."
      redirect_to works_path
    end

  end
end
