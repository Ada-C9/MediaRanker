class VotesController < ApplicationController

  def create
    if session[:user_id]
      new_vote = {
        user_id: session[:user_id],
        work_id: params[:work_id]
      }
      @vote = Vote.new(new_vote)
      if @vote.save
        flash[:success] = "You have successfully voted"
        redirect_to works_path
      else
        flash[:alert] = "Vote did not save"
        redirect_to works_path
      end
    else
      flash[:alert] = "You must be log in to do that"
      redirect_to works_path
    end
  end

  def destroy
    Vote.destroy(params[:id])
    redirect_to users_path
    flash[:alert] = "Vote Deleted"
  end

end
