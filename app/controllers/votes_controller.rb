class VotesController < ApplicationController
  def edit
  end

  def index
    @votes = Vote.all
  end

  def new
    new_vote = Vote.new(user_id: @user.id)
    redirect_to works_path
  end

  def show
  end

  def create
    @vote = Vote.new(new_vote)
    if @vote.save
      flash[:success] = "Successfully upvoted!"
      redirect_to works_path
    else
      flash.now[:alert] = @vote.errors
    end
  end

  def destroy
  end

  def update
  end

  private

  def vote_params
    return params.require(:vote).permit(:user_id, :work_id)
  end
end
