class VotesController < ApplicationController

  def new
    @votes = Votes.new
  end

  def create
    @vote = Votes.new(vote_params)
  end

  def show

  end

  private
  def vote_params
    return params.require(:vote).permit(:user_id, :work_id)
  end

end
