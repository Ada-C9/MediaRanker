class WorksController < ApplicationController
  def edit
  end

  def index
    @works = Work.all
  end

  def new
  end

  def show
    @work = Work.find(params[:id])
  end

  def create
  end

  def destroy
  end

  def update
  end
end
