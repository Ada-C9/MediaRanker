class VotesController < ApplicationController



  def index
    @votes = Vote.all
  end

  def new
    @vote = Vote.new
  end

  def show
    @vote = Vote.find_by(id: params[:id])
  end

  def edit
  end

  def create

  end

  def update
  end

  def destroy
  end
end
