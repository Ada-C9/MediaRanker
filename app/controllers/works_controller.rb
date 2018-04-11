class WorksController < ApplicationController

  def index
    @works = work.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
    @work = work.new
  end

  def create
  end

  def destroy
  end

  private
  def user_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description :id )
  end
end

# def index
#   @works = work.all
# end
#
# def show
#   @work = work.find_by(id: params[:id])
# end
#
# def edit
#   @work = work.find_by(id: params[:id])
# end
#
# def update
#   work = work.find_by(id: params[:id])
#   work.update(work_params)
#   redirect_to work_path(params[:id])
# end
#
# def new
#   @work = work.new
# end
#
# def create
#   work.create(work_params)
#   redirect_to works_path
# end
#
# def destroy
#   @work = work.find_by(id: params[:id])
#   @work.destroy
#   redirect_back fallback_location: :works_path
# end
#
# private
# def work_params
#   return params.require(:work).permit(:category, :title, :creator, :publication_year, :description :id)
# end
end
