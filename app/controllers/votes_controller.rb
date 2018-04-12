class VotesController < ApplicationController

  before_action :find_user

  def create
    publication = Publication.find_by(id: params[:publication_id])
    vote = Vote.new(user: @user, publication: publication)
    if vote.save
      flash[:success] = "Successfully upvoted!"
    elsif !@user
      flash[:alert] = 'You must log in to do that'
    else
      flash[:alert] = {"upvote" => {"user": "has already voted for this work"}}
    end
    redirect_back fallback_location: root_path
  end

end
