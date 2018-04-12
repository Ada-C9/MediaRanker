class WorksController < ApplicationController
  include GetUsername
  before_action :get_username
  before_action :find_work, only: [:show, :edit, :update]

  # before action for top and index?
  def top
    @top_albums = Work.order_by_vote(categorize('album')).first(10)
    @top_books = Work.order_by_vote(categorize('book')).first(10)
    @top_movies = Work.order_by_vote(categorize('movie')).first(10)
    @top = Work.top_work
  end

  # this needs to be dryer
  def index
    if params[:category] == 'books'
      @books = Work.order_by_vote(categorize('book'))
    elsif params[:category] == 'albums'
      @albums = Work.order_by_vote(categorize('album'))
    elsif params[:category] == 'movies'
      @movies = Work.order_by_vote(categorize('movie'))
    else
      @albums = Work.order_by_vote(categorize('album'))
      @books = Work.order_by_vote(categorize('book'))
      @movies = Work.order_by_vote(categorize('movie'))
    end
  end

  def new
    @work = Work.new
    if params[:category]
      @work.category = categorize('books').name
    end
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
    @votes = Vote.where(work_id: @work.id)
  end

  def edit; end

  def update
    @work.assign_attributes(work_params)

    if @work.save
      flash[:success] = "#{@work.category.name.capitalize} successfully updated"
      redirect_to work_path(@work)
    else
      flash.now[:failure] = "A problem occured. Could not create #{@work.category.name}."
      render :edit
    end
  end

  def destroy
    work = Work.find(params[:id])
    id = work.id
    category = Category.find(work.category_id)
    result = Work.destroy(params[:id])
    if result
      flash[:success] = "Successfully destroyed #{category.name} #{id}"
    end
    redirect_to root_path
  end

  def upvote
    user_id = session[:user_id]
    work = Work.find(params[:work_id])
    @vote = Vote.new(user_id: user_id, work_id: work.id)

    if session[:user_id]
      if @vote.save
        flash[:success] = 'Successfully upvoted!'
      else
        flash[:failure] = 'Could not upvote'

        # this will only flash the first message for the column
        flash[:error] = @vote.errors.messages.map { |k,v| "#{k} - #{v[0]}" }.join('<br>').html_safe
      end
    else
      flash[:failure] = 'You must log in to do that'
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def categorize(category)
    return Category.find_by(name: category).id
  end

  def work_params
    return params.require(:work).permit(:title, :category_id, :creator, :publication_year, :description)
  end

  def find_work
    @work = Work.find(params[:id])
  end

end
