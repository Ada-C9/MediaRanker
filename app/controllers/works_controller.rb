class WorksController < ApplicationController
  include GetUsername
  before_action :get_username

  def index
    if params[:books]
      @books = Work.where(category_id: categorize('book'))
    elsif params[:albums]
      @albums = Work.where(category_id: categorize('album'))
    else
      @albums = Work.where(category_id: categorize('album'))
      @books = Work.where(category_id: categorize('book'))
      @movies = Work.where(category_id: categorize('movie'))
    end
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:success] = "#{@work.category.name.capitalize} successfully added"
      redirect_to work_path(@work)
    else
      flash.now[:failure] = "A problem occured. Could not create #{@work.category.name.capitalize}."
      render :new
    end
  end

  def show
    work_id = params[:id]
    @work = Work.find(work_id)
    @votes = Vote.where(work_id: work_id)
  end

  def edit
    work_id = params[:id]

    @work = Work.find(work_id)
  end

  def update
    @work = Work.find(params[:id])
    @work.assign_attributes(work_params)

    if @work.save
      flash[:success] = "#{@work.category.name.capitalize} successfully updated"
      redirect_to work_path(@work)
    else
      flash.now[:failure] = "A problem occured. Could not create #{@work.category.name.capitalize}."
      render :edit
    end
  end

  def destroy
    Work.destroy(params[:id])
  end

  def upvote
    user_id = session[:user_id]
    work = Work.find(params[:work_id])
    vote = Vote.new(user_id: user_id, work_id: work.id)

    if vote.save
      flash[:success] = 'Successfully upvoted!'
    else
      flash[:failure] = 'Could not upvote'
    end
    redirect_to work_path(work.id)
  end

  private

  def categorize(category)
    return Category.find_by(name: category).id
  end

  def work_params
    return params.require(:work).permit(:title, :category, :creator, :publication_year, :description)
  end


end
