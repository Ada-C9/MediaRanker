class VotesController < ApplicationController
  before_action :logged_in

  def create
    @vote = Vote.new
    @vote.user_id = session[:user_id]
    @vote.work_id = params[:work_id]

    if @vote.save
      flash[:success] = "You voted for #{@vote.work.title}"
      redirect_to work_path(params[:work_id])
    else
      flash[:alert] = @vote.errors
      redirect_to work_path(params[:work_id])
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:user_id, :work_id)
  end
end
