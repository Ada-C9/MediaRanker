class VotesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @vote = Vote.new
    @vote.work_id = Work.find_by(id: params[:work_id]).id
    @vote.user_id =
    # need to add conditional that checks if user is logged in, in order to be able to upvote...and use flash notices to remind user to login first
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
