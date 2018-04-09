class WorksController < ApplicationController

  def index
    user = Work.all
  end

  def new
    user = Work.new
  end

  def create

  end

  def show
    user = Work.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
