class SubredditsController < ApplicationController
  def index
    @subreddits = Subreddit.all
  end

  def new
    @subreddit = Subreddit.new
  end

  def create
    @subreddit = Subreddit.new(subreddit_params)
    if @subreddit.save
      redirect_to subreddits_path
    else
      render :new
    end
  end

  def show
    @subreddit = Subreddit.find(params[:id])
  end

  def edit
    @subreddit = Subreddit.find(params[:id])
  end

  def update
    subreddit = Subreddit.find(params[:id])
    subreddit.assign_attributes(subreddit_params)
    if subreddit.save
      redirect_to subreddit_path(subreddit)
    end
  end

  def delete
    Subreddit.destroy(params[:id])
  end



  private
  def subreddit_params
    return params.require(:title).permit(:description,:subscribers)
  end
end
