class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
    @work = Work.find_by(id: params[:id])
  end

  def destroy
  end

  def upvote
  end
end
