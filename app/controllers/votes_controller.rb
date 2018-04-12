class VotesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @vote = Vote.new
      @vote.creator = Work.find(params[:creator_id])
  end

  def create
    @vote = Vote.new(work_id: @work.id)
    @vote.creator = Work.find(params[:creator_id])

    if @work.save
      flash[:sucess] = "Vote saved"
      redirect_to works_path
    else
      flash.now[:alert] = "Media was not save."
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
