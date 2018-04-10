class WorksController < ApplicationController
  def index
    @albums = Work.where(category:"album")
    @books = Work.where(category:"book")
    @movies = Work.where(category:"movie")
  end

  def show
    @work = Work.find(params[:id])
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:notice] = "Successfully created #{@work.category} #{@work.id}"
      redirect_to work_path(@work)
    else
      render :new
    end
  end

  def edit
    @work = Work.find_by(id: params[:id])
  end

  def update
    @work = Work.find_by(id: params[:id])
    if !@work.nil?
      if @work.update(work_params)
        flash[:success] = "Successfully updated #{@work.category} #{@work.id}"
        redirect_to work_path(@work.id)
      else
        render :edit
      end
    else
      redirect_to works_path
    end
  end

  def destroy
    id = params[:id]
    begin
      @work = Work.find(id)
      if @work
        @work.destroy
      end
      flash[:success] = "#{@work.title} deleted"
    rescue
      flash[:alert]= "Work does not exist"
    end
    redirect_to works_path
  end
end

private

def work_params
  return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
end
