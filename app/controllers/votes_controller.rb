class VotesController < ApplicationController
  def index
    @votes = Vote.all
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

  def show
    vote_id = params[:id]
  end

  def update
    @vote = Vote.find(params[:id])
    @vote.assign_atrributes(vote_params)
    if @vote.save
      #  ?
      redirect_to vote_path(vote)
    else
      render :edit
    end
  end

  def edit
    @vote = Vote.find(params[:id])
  end

  def destroy
    Vote.destroy(params[:id])
    redirect_to votes_path
  end
end
