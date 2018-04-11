class UpvotesController < ApplicationController
  def create
    @upvote = Upvote.new(user_id:session[:user_id], work_id:params[:id])
    if @upvote.save
      flash[:success] = "Successfully upvoted!"
      redirect_to works_path
    else
      error = @upvote.errors
      if !error[:user].empty?
        flash[:error] = "You must log in to do that"
      else
        flash[:error] = "You can't upvote more than once!"
      end
      redirect_to works_path
    end

  end
end
