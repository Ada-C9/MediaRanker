class VotesController < ApplicationController
  before_action :find_vote, only: [:show, :edit, :update, :destroy]

  # I want to add new to make sure that no previous vote occur. using find_where (vote.user_id & vote.work_id match the new vote
  def index
    @votes = Vote.all
  end

  # I don't think I need to see the invididual votes or all the votes.
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
    @vote = Vote.new
  end

  def create
    @vote = Vote.create(vote_params)
    if @vote.id != nil
      Vote.voted(@vote)
      flash[:success] = "Upvoted"
      redirect_to :back
    else
      flash.now[:alert] = @vote.errors
      render :new
    end
  end

  def destroy
    @vote.destroy
    redirect_back fallback_location: :votes_path
  end

  private
  def user_params
    return params.require(:user).permit(:username, :id)
  end

  def find_vote
    @vote = Vote.find_by(id: params[:id])
  end

end
