class VotesController < ApplicationController
  def edit
  end

  def index
    @votes = Vote.all
  end

  def new
    @vote = Vote.new
  end

  def show
  end

  def create
    @vote = Vote.find_by(id: params[:id])
    @vote.update(vote_params)
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
