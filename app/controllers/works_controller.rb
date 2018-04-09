class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def show
    work_id = params[:id]

    @work = Work.find_by(id: work_id)
  end
end
