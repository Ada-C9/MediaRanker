class VotesController < ApplicationController

  before_action :find_user

  def index
  end

  def show
  end

  def new
  end

  def create
    if @user
      @vote = Vote.new
      @vote.work_id = Work.find_by(id: params[:work_id]).id
      @vote.user_id = @user.id
      if @vote.save
        flash[:success] = "Successfully upvoted!"
        redirect_back fallback_location: :works_path
      end
    else
      flash[:error] = "You must be logged in to vote."
      redirect_back fallback_location: :works_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
