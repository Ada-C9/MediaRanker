class WorksController < ApplicationController

  def index
    @works = Work.all


  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to work_path(@work)
    end
  end

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    the_work = Work.find(params[:id])
    # the_book.title = updated_book[:title]
    # the_book.author = updated_book[:author]
    # the_book.publication_date = updated_book[:publication_date]
    # the_book.synopsys = updated_book[:synopsys]
    the_work.update_attributes(
      category: work_params[:category],
      title: work_params[:title],
      created_by: work_params[:created_by],
      published: work_params[:published],
      description: work_params[:description],
    )

    if the_work.save
      redirect_to works_path
    end
  end

  def upvote
    if User.find(session[:user_id]) !=nil
    user = User.find(session[:user_id])
  else
    flash[:failure] = "You must log in to do that"
    redirect_to works_path
    end

    work_id = params[:id]


    vote = Vote.new(user_id: user.id, work_id: work_id)

    if vote.save
      flash[:success] = "Successfully upvoted!"

    else
      flash[:failure] = "Could not upvote"
      flash[:errors] = vote.errors.messages[:user_id]


    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    Work.destroy(params[:id])
    redirect_to root_path
  end

  private
  def work_params
    return params.require(:work).permit(:category, :title, :published, :description, :created_by)
  end
end
