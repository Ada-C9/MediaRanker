class VotesController < ApplicationController
  before_action :find_user, only: [:create]

  def create
    @vote = Vote.new
    @vote.work_id = Work.find_by(id: params[:work_id]).id
    if @user
      @vote.user_id = @user.id
      if @vote.save
        flash[:success] = "Successfully upvoted!"
        redirect_back fallback_location: :work_path
      else
        flash[:notice] = "Could not upvote"
        flash[:alert] = { user: "has already voted for this work" }
        redirect_back fallback_location: :works_path
      end
    else
      flash[:notice] = "You must log in to do that"
      redirect_back fallback_location: :works_path
    end
  end

end
