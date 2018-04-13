class VotesController < ApplicationController
  before_action :find_vote, only: [:show, :edit, :update]

  def index
    @votes = Vote.all
  end

  def new
    @vote = Vote.new
  end

  def create
    if session[:user_id]

      new_vote = {
        user_id: session[:user_id],
        work_id: params[:work_id]
      }

      @vote = Vote.new(new_vote)

      if @vote.save
        flash[:notice] = "Successfully upvoted"
      else
        flash[:alert] = "Could not upvote"
        flash[:notice] = @vote.errors.full_messages
      end
    end
    redirect_to request.referer
  end

  def show; end

  def edit; end

  def update
    @vote.assign_attributes(vote_params)

    if @vote.save
      redirect_to vote_path(@vote)
    else
      render :edit
    end
  end

  def destroy
    Vote.destroy(params[:id])

    redirect_to votes_path
  end

  private

  def vote_params
    return params.require(:vote).permit(:user_id, :work_id)
  end

  def find_vote
    @vote = Vote.find(params[:id])
  end

end
