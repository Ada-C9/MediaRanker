class VotesController < ApplicationController
  def index

  end

  def new

  end

  def create
    if session[:user_id]

      new_vote = {
        user_id: session[:user_id],
        work_id: params[:work_id]
      }
      @vote = Vote.new(new_vote)

      if @vote.save
        flash[:notice] = "Successfully upvoted!"
      else
        flash[:alert] = "Could not upvote"
        flash[:notice] = @vote.errors.full_messages
      end
    end
    redirect_to request.referer
  end

  def show

  end

  def update

  end

  def edit

  end

  def destroy

  end


end
