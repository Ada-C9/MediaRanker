class WorksController < ApplicationController
  before_action :find_work, only: [:show, :edit, :update,:destroy]

  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      redirect_to works_path
    else
      render :new
    end
  end

  def show

  end

  def edit


  end


  def update
    if @work.update(work_params)
        redirect_to work_path(@work.id)
      else
        render :edit
      end
  end

  def destroy
    if @work
      if @work
        @work.destroy
      else
      flash[:success] = "#{@work.title} deleted"
    end
      flash[:alert] = {work: "does not exist"}
    end
    redirect_to root_path

  end
  def upvote
    @vote = Vote.new
    @vote.user = User.find(session[:user_id])
    @vote.work = Work.find_by(id: params[:id])
    @vote.date =  Date.today
    if @vote.save
      redirect_to root_path
    else

    end
  end
  private
  def work_params
    return params.require(:work).permit(:category, :title, :created, :publication_year, :description)
  end
  def find_work
    @work = Work.find_by(id: params[:id])
  end

end
