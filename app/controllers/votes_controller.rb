class VotesController < ApplicationController

  def new

  end

  def create
    @vote = Vote.new(user_id: session[:user_id])

    if @vote.save
      flash[:status] = :success
      flash[:message] = "Successfully created work #{@vote.id}"
      redirect_to works_path
    else
      # Tell user what went wrong
      flash[:status] = :failure
      flash[:message] = "Failed to vote"
      flash[:details] = @vote.errors.messages
      redirect_to works_path
    end
  end
end
