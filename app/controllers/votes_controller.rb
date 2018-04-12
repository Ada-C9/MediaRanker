class VotesController < ApplicationController
  def create
    vote = Vote.new
    vote.work_id = params[:work_id]
    vote.user_id = session[:user_id]

    if vote.save
      flash[:success] = "Successfully updated!"
      redirect_back(fallback_location: works_path)
    else
      flash[:failures] = "You must login to do that"
      redirect_to works_path
    end
  end
end
