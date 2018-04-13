class VotesController < ApplicationController



  def index
    @votes = Vote.all
  end

  def new
    @vote = Vote.new
  end

  def show
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
