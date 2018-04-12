class VotesController < ApplicationController

  def new
    @vote = Vote.new(user_id: params[:user_id])
  end

  def create
    @vote = Vote.new
    if @vote.save
      redirect_to _path
    else
      render :new
    end
  end

  def destroy
    Vote.destroy(params[:id])
    redirect_to users_path
    flash[:alert] = "Vote Deleted"
  end
end
