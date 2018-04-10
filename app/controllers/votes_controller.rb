class VotesController < ApplicationController
  def index

  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new
    if @vote.save
      redirect_to works_show(params[:id])
    else
      render :new
    end

  end
end
