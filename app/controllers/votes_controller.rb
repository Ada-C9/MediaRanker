class VotesController < ApplicationController
before_action :find_user


  def index
    @votes = Vote.all
  end

  def new

  end

  def show
  end

  def edit
  end

  def create
    if !@user
      flash[:alert] = "You must be logged in to vote"

      redirect_to root_path
      # redirect_back fallback_location
    else
      @vote = Vote.create
      @vote.work_id = Work.find_by(id: params[:work_id]).id
      @vote.user_id = @user.id
      if @vote.save
        flash[:success] = "Successfully upvoted!"
        redirect_to root_path
      else
        flash[:alert] = @vote.errors
        redirect_to root_path
      end

    end
  end

  def update
  end

  def destroy
  end
end
