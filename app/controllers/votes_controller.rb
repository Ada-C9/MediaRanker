class VotesController < ApplicationController
  def upvote
    if session[:user_id]
      @vote = Vote.new(user_id: session[:user_id], work_id: params[:work_id])

      if @vote.save
        flash[:success] = "successfully upvoted"
        redirect_back fallback_location: root_path

      else
        flash[:failure] = "Could not upvote"
        flash[:error] = @vote.errors.messages
        redirect_back fallback_location: root_path
      end

    else
      flash[:failure] = "You must log in to do that"
      redirect_back fallback_location: root_path
    end
  end
end
