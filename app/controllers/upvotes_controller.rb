class UpvotesController < ApplicationController
  before_action :find_user

  def create
    if !@user
      flash[:notice] = "You must log in to do that"
      redirect_back fallback_location: :works_path
    else
      @upvote = Upvote.new(user_id:session[:user_id], work_id:params[:work_id])
      if @upvote.save
        flash[:success] = "Successfully upvoted!"
        redirect_to works_path
      else
        flash[:notice] = "Could not upvote"
        flash[:alert] = { user: "has already voted for this work" }
        redirect_back fallback_location: :works_path
      end
    end
  end
end
