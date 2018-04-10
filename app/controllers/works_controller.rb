class WorksController < ApplicationController

  def index
    @works = Work.top_ten
    @categories = Category.all
  end

  def new

  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  def top
    @works = Work.all
    @categories = Category.all
  end




end
