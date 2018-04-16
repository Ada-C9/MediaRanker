class WorksController < ApplicationController
  before_action :find_user
  def index
    @works = Work.all
    @types = ["movie", "book", "album"]
  end

  def show
    @work = Work.find(params[:id].to_i)
  end

  def create
    @work = Work.create work_params

    if @work.id != nil
      flash[:success] = "Successfully created #{@work.category} #{@work.id}"
      redirect_to works_path
    else
      flash[:error] = "A problem occurred: Could not create #{@work.category}
"
      render :new
    end
  end

  def new
    @work = Work.new
  end

  def destroy
    @work = Work.find(params[:id].to_i).destroy
    flash[:success] = "Deleted the work"
    redirect_to works_path
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id].to_s)
    redirect_to work_path unless @work

    @work.update_attributes work_params
    if @work.update_attributes work_params
      redirect_to work_path
      flash[:success] = "Updated #{@work.title}"
    else
      render :edit
    end
  end

  def top
    @types = ["movie", "book", "album"]
  end

  private
    def work_params
      return params.require(:work).permit(:title, :description, :category, :created_by, :year)
    end

end
