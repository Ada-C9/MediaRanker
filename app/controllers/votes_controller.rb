class VotesController < ApplicationController

  def index
    @works = Work.all
  end

  def upvote
    vote_attributes = {
      work_id: params[:id],
      user_id: session[:user_id],
    }

    vote = Vote.new(vote_attributes)

    if vote.save
      flash[:success] = "Voted"
      redirect_back(fallback_location: root_path)
    end
  end

end
