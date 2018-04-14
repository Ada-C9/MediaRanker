class VotesController < ApplicationController
  before_action :find_vote, only: [:show, :edit, :update, :destroy]

  # I want to add new to make sure that no previous vote occur. using find_where (vote.user_id & vote.work_id match the new vote
  def index
    @votes = Vote.all
  end

  def show
  end

  def edit
  end

  def update
    @vote.update(vote_params)
    @work = Work.find(@vote.work_id)
    # is this correct, sending it to the work main page
    redirect_to work_path(@work.id)
  end

  def new
    if find_vote
      flash[:alert] = "Could not upvote user: has already voted for this work"
    else
      @vote = Vote.new
    end
  end

  def create
    if find_vote
      flash[:alert] = "Could not upvote user: has already voted for this work"
    else

      @vote = Vote.create(vote_params)
      @vote.user_id = session[:user_id]
      @vote.work_id = vote_params[:work_id]

      if @vote.save
        flash[:success] = "Upvoted"
      else
        flash[:fail] = @vote.errors
      end
    end
    redirect_to work_path(params[:work_id])
  end

  def destroy
    @vote.destroy
    redirect_back fallback_location: :votes_path
  end

  private
  def vote_params
    return params.permit(:user_id, :work_id)
  end

  def find_vote
    @vote = Vote.find_by id: params[:id]
  end

end
