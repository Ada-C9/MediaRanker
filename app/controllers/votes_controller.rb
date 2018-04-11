class VotesController < ApplicationController
  def index
    @votes = Vote.all
  end

# I don't think I need to see the invididual votes or all the votes.
  def show
    @vote = Vote.find_by(id: params[:id])
  end

  def edit
    @vote = Vote.find_by(id: params[:id])
  end

  def update
    @vote = Vote.find_by(id: params[:id])

    # I am unsure why this is vote_params ? Where is this coming from?
    @vote.update(vote_params)

    redirect_to vote_path(params[:id])
  end

  def new
    @vote = Vote.new
  end

  def create
  end

  def destroy
    @vote = Vote.find_by(id: params[:id])
    @vote.destroy
    redirect_back fallback_location: :votes_path
  end

  private
  def user_params
    return params.require(:user).permit(:username, :id)
  end
end
