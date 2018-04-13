class VotesController < ApplicationController

  def new
    @vote = Vote.new(user_id: params[:user_id])
    @vote.work_id = Work.find(@work.id)
  end

  def create
      @vote = Vote.new

    if @vote.save
      redirect_to works_path
    else
      flash.now[:alert] = "You must log in to do that"
      render :new
    end
  end

  def destroy
    Vote.destroy(params[:id])
    redirect_to users_path
    flash[:alert] = "Vote Deleted"
  end
end
