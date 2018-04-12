class WorksController < ApplicationController
  def index
    works = Work.all
    @albums = works.where(category: 'album')
    @books = works.where(category: 'book')
    @movies = works.where(category: 'movie')
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
      flash[:success] = "Successfully created #{@work.category} #{@work.id}"
      redirect_to work_path(@work)
    else
      # include error messages
      flash.now[:failure] = "A problem occurred: Could not create #{@work.category}"
      render :new
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    @work.assign_attributes(work_params)

    if @work.save
      flash[:success] = "Successfully updated #{@work.category} #{@work.id}"
      redirect_to work_path(@work)
    else
      # include error messages
      flash.now[:failure] = "A problem occurred: Could not update #{@work.category}"
      render :edit
    end
  end

  def destroy
    if Work.destroy(params[:id])
      redirect_to works_path
    end
  end

  def upvote

    if session[:user_id]

      user = User.find(session[:user_id])
      work = Work.find(params[:format])
      vote = Vote.new
      vote.assign_attributes(user: user, work: work)

      if vote.save
        flash[:success] = "Successfully upvoted!"
        redirect_back(fallback_location: root_path)
      elsif !vote.valid?
        flash[:failure] = "Could not upvote"
        redirect_back(fallback_location: root_path)
      end

    else
      flash[:failure] = "You must log in to do that"
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def work_params
    return params.require(:work).permit(:title, :creator, :publication_year, :category, :description)
  end
end
