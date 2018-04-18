class VotesController < ApplicationController

  def index

  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(user_id: session[:user_id], work_id: params[:work_id])
    if @vote.save #it worked
      flash[:success] = "Successfully upvoted"
    else
      if @vote.id.nil?
        flash[:alert] = @vote.errors
      end
    end
    redirect_to work_path(params[:work_id])
  end


  private

  def vote_params
    # You don't need an explicit return here, but if it helps keep things straight in your head, it's okay to do it.
    params.require(:vote).permit(:user_id, :work_id)
  end
end
