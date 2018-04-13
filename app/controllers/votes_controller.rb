class VotesController < ApplicationController
  # def index; end

  # def new
  #   @vote = Vote.new
  # end

  def upvote
    # errors if user already voted
    # how to use redirect back
    if session[:user_id]
      @vote = Vote.new(user_id: session[:user_id], work_id: params[:work_id])

      if @vote.save
        flash[:success] = "successfully upvoted"
        redirect_back fallback_location: root_path

      else
        flash[:failure] = "Could not upvote"
        flash[:error] = @vote.errors.messages[:name]
        redirect_back fallback_location: root_path
      end

    else
      flash[:failure] = "You must log in to do that"
      redirect_to work_path(params[:work_id])
    end
  end
end
