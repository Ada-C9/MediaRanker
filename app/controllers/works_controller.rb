class WorksController < ApplicationController

  before_action :find_work, only: [:show, :edit, :update]

  def index
    @works = Work.top_ten
    @categories = Category.all
  end

  def new
    @work = Work.new
    @categories = Category.all
  end

  def create

  end

  def show; end

  def edit; end

  def update

  end

  def destroy

  end

  def top
    @works = Work.all
    @categories = Category.all
  end

  private

  def find_work
    @work = Work.find(params[:id])

  end

end
