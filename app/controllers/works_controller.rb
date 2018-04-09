class WorksController < ApplicationController
  def index
    @works = Work.all.order(id: :asc)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
