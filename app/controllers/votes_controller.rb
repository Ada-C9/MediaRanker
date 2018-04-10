class VotesController < ApplicationController
  def index
    @votes = Vote.all
  end

  def show
    id = params[:id]
    @vote = Vote.find(id)
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      redirect_to votes_path
    else
      render :new
  end 
end
