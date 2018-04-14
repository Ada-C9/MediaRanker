class VotesController < ApplicationController
  def index
    @votes = Vote.all
  end

  def create
    @vote = Vote.new(user_id: @user.id, work_id: params[:work_id])
    if @vote.save
      flash[:success] = "Successfully upvoted!"
      redirect_to works_path
    else
      flash.now[:alert] = @vote.errors
    end
  end

  private

  def vote_params
    return params.require(:vote).permit(:user_id, :work_id)
  end
end
