class VotesController < ApplicationController

  def new
    @vote = Vote.new
  end

  def create
    if params[:user_id]
      @vote = Vote.new(user_id: params[:user_id][:work_id])
      @vote.save
      redirect_to root_path
    else
      flash[:alert] = "You must log in to do that"
      redirect_to users_path
    end
  end

  def destroy
    Vote.destroy(params[:id])
    redirect_to users_path
    flash[:alert] = "Vote Deleted"
  end
end
