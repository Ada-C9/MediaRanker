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
        flash[:error] = @vote.errors.messages[:name][0]
        redirect_back fallback_location: root_path
      end

    else
      flash[:failure] = "You must log in to do that"
      redirect_back fallback_location: works_path
    end
  end
end
