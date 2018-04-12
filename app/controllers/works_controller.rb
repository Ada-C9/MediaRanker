class WorksController < ApplicationController
  def index
    @movies = Work.where(category: 'movie')
    @books = Work.where(category: 'book')
    @albums = Work.where(category: 'album')
  end

  def show
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:success] = "Succesfully created #{@work.category} #{@work.id}."
      redirect_to work_path(@work.id)
    else
      flash.now[:alert] = {}
      @work.errors.each do |field, message|
        flash.now[:alert] = @work.errors
      end
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    #add loop to delete all votes assoc. with particular user?
  end

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year)
  end

end
