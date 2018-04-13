class VotesController < ApplicationController

  def create
    work = Work.find(params[:work_id])

    if user = User.find_by(id: session[:user_id])
      @vote = Vote.create(work_id: work.id, user_id: user.id)
      redirect_to request.referrer
    else
      flash[:failure] = "You must be logged in to Upvote!"
      redirect_to request.referrer
    end
  end
end
