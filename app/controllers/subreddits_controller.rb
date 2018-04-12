class SubredditsController < ApplicationController

  before_action :find_subreddit, only: [:show, :edit, :update]
  def index
    @subreddits = Subreddit.all
  end

  def new
    @subreddit = Subreddit.new
  end

  def create
    @subreddit = Subreddit.new(subreddit_params)
    if @subreddit.save
      #works.create
      flash[:success] = "Book added successfully"
      redirect_to subreddits_path
    else
      flash.now[:failure] = "Validations Failed"
      render :new
    end
  end

  def show;end

  def edit;end

  def update

    @subreddit.assign_attributes(subreddit_params)
    if @subreddit.save
      redirect_to subreddit_path(subreddit)
    else
      render :edit
    end
  end

  def destroy
    Subreddit.destroy(params[:id])
    
      redirect_to subreddits_path
            #if delete works.delet
  end



  private
  def subreddit_params
    return params.require(:subreddit).permit(:description, :subscribers, :title)
  end

  def find_subreddit
    @subreddit = Subreddit.find(params[:id])
  end
end
