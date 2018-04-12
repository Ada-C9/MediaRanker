class WorksController < ApplicationController
  before_action :find_work, only: [:show, :update, :edit, :destroy, :upvote]

  def index
    @movies = Work.where(category: 'movie')
    @books = Work.where(category: 'book')
    @albums = Work.where(category: 'album')
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:success] = "#{@work.title} added successfully!"
      redirect_to work_path(@work)
    else
      flash.now[:failure] = "Requested action could not be completed"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @work.assign_attributes(work_params)

    if @work.save
      redirect_to work_path(@work)
    else
      render work_path(@work)
    end
  end

  def destroy
    @work.destroy

    redirect_to works_path
  end

  def upvote
    user = User.find_by(id: session[:user_id])

    vote = Vote.new(user_id: user.id, work_id: @work.id)

    if vote.save
      flash[:success] =  "Thank you for upvoting!"
      redirect_to(works_path)
    else
      flash[:failure] =  "You have already upvoted this!"
      redirect_to(works_path)
    end
  end


  private

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end

  def find_work
    @work = Work.find(params[:id])
  end

end
