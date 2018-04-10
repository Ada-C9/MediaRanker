class WorksController < ApplicationController
  def index
    @works = Work.all
    @hash = Work.make_category_hash
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
  end

  def destroy
  end

  def upvote
  end
end
