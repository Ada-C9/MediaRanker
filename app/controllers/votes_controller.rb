class VotesController < ApplicationController

  before_action :find_user

  def create
    if !@user
      flash[:alert] = 'You must log in to do that'
      redirect_back fallback_location: root_path
      return nil
    end
    publication = Publication.find_by(id: params[:publication_id])
    vote = Vote.new(user: @user, publication: publication)
    if vote.save
      flash[:success] = "Successfully upvoted!"
      redirect_back fallback_location: root_path
    else
      flash[:alert] = {"upvote" => {"user": "has already voted for this work"}}
      redirect_back fallback_location: root_path
    end
  end

end
