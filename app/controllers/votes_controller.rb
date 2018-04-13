class VotesController < ApplicationController

  before_action :current_user

  def index
  end

  def new
  end

  def create
    @vote = Vote.new
    @vote.work_id = Work.find_by(id: params[:work_id]).id
    @vote.user_id = @user.id
    if @vote.save
      flash[:success] = "Successfully upvoted!"
      redirect_back fallback_location: :works_path
    else
      flash.now[:alert] = @vote.errors
      render :new
    end
  end

  def show
  end

  def update
  end

  def destroy
  end

  def edit
  end
end
