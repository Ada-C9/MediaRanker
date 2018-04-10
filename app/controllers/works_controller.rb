class WorksController < ApplicationController

  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to work_path(@work)
    end
  end

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    the_work = Work.find(params[:id])
    # the_book.title = updated_book[:title]
    # the_book.author = updated_book[:author]
    # the_book.publication_date = updated_book[:publication_date]
    # the_book.synopsys = updated_book[:synopsys]
    the_task.update_attributes(
      name: updated_task[:name],
      description: updated_task[:description],
      completion: updated_task[:completion],
      priority: updated_task[:priority],
    )

    if the_task.save
      redirect_to tasks_path
    end
  end

  def destroy
    Work.destroy(params[:id])
    redirect_to root_path
  end

  private
  def work_params
    return params.require(:work).permit(:category, :title, :published, :description, :created_by)
  end
end
