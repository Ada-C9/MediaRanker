class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def main
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      flash[:success] = "Successfully created #{@work.category} #{@work.id}"
      redirect_to work_path(@work)
    else
      render :new
    end
  end

  def show
    work_id = params[:id]

    @work = Work.find_by(id: work_id)
  end

  def destroy
    @work = Work.find(params[:id])

    @work.delete
    flash[:success] = "Successfully destroyed #{@work.category} #{@work.id}"

    redirect_to root_path
  end


  private

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end

end
