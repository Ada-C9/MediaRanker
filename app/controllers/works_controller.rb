class WorksController < ApplicationController

  def index
    @works = Work.all
    @types = ["movie", "book", "album"]
  end

  def show
    @work = Work.find(params[:id].to_i)
  end

  def create
  end

  def new
    @work = Work.new
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def top
  end


end
