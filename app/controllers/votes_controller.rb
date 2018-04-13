class VotesController < ApplicationController
  before_action :find_vote, only: [:show, :edit, :update, :destroy]

  before_action :find_user

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
    @author = Author.create(author_params)
    if @author.id != nil
      flash[:success] = "Author Created"
      redirect_to authors_path
    else
      flash.now[:alert] = @author.errors
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

  def find_user
    @user = User.find_by(id: params[:user_id])
  end
end
