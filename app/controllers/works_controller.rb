class WorksController < ApplicationController
  before_action :find_user
  before_action :find_work
  def index
    @sorted = Work.categorized
  end

  def show
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:success] = "#{@work.title} created"
      redirect_to works_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @work.update(work_params)
      redirect_to works_path
    else
      render :edit
    end
  end

  def destroy
    if @work
      @work.upvotes.each do |upvote|
        upvote.destroy
      end

      @work.destroy

      if Work.find_by(id: params[:id]).nil?
        flash[:success] = "#{@work.title} deleted"
      end
    end
    redirect_to works_path
  end


  private
  def work_params
    return params.require(:work).permit(:title, :category, :creator, :publication_year, :description, :votes)
  end

  def find_work
    @work = Work.find_by id: params[:id]
  end
end
