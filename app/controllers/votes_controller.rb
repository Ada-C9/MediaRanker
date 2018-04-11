class VotesController < ApplicationController

  def index
    @votes = Vote.all
  end

  def create
  end

end
