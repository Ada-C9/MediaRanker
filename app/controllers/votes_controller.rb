class VotesController < ApplicationController
  def index; end

  def new
    @vote = Vote.new
  end

  def upvote
    if session[:user_id]
      @vote = Vote.new(user_id: session[:user_id], work_id: params[:work_id])

      if @vote.save
        redirect_to work_path(params[:work_id])
      else
        redirect_to work_path(params[:work_id])
      end

    else
      flash[:failure] = "You must log in to do that"
      redirect_to work_path(params[:work_id])
    end
  end
end
