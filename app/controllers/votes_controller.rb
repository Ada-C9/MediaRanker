class VotesController < ApplicationController
  def create
    vote = Vote.new
    vote.work_id = params[:work_id]
    vote.user_id = session[:user_id]

    vote.save
    redirect_to works_path
  end
end
