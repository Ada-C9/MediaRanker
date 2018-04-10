class WorksController < ApplicationController
  def index
    if params[:author_id]
      @works = Category.find(params[:category_id]).works
    else
      @works = Work.all
    end
  end

  def new
    @work = Work.new(author_id: params[:author_id])
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      redirect_to '/works'
      # can also do
      # redirect_to works_path
    else
      # Validations failed! What do we do now? See below...
      render :new
    end

  end

  def show
    # Figure out which work the user wanted
    work_id = params[:id]

    # Load it from the DB
    # Save it in an instance variable for the view
    @work = Work.find(work_id)

  end

  def edit
    @work = Work.find(params[:id])
  end

  def update

    @work = Work.find(params[:id])

    @work.assign_attributes(work_params)

    if @work.save
      redirect_to work_path(@work)
    else
      render :edit
    end
  end

  def destroy
    # find it first
    # check the result of destroy

    Work.destroy(params[:id])

    redirect_to works_path
  end

  private
  def work_params
    return params.require(:work).permit(:category_id, :title, :creator, :publication_year, :description])
  end
end
