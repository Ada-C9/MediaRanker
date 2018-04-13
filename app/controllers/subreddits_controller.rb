class SubredditsController < ApplicationController

  before_action :find_subreddit, only: [:show, :edit, :update]
  def index
    @subreddits = Subreddit.first_10(Subreddit.mostVoted)
  end

  def new
    @subreddit = Subreddit.new
  end

  def create
    @subreddit = Subreddit.new(subreddit_params)
    if @subreddit.save
      #works.create
      flash[:success] = "Subreddit added successfully"
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

  def upvote
    if session[:user_id]
      user_id = session[:user_id]

      @vote = Vote.new(user_id: user_id, subreddit_id: params[:subreddit_id])

      if @vote.save
        flash[:success] = "You voted!"
        redirect_to root_path
      else
        flash[:failure] = "You couldn't vote! Did you vote for this already?"
        redirect_to subreddits_path
      end
    else
      flash[:failure] = "You need to be logged in to vote!"
    end
  end


  private
  def subreddit_params
    return params.require(:subreddit).permit(:description, :subscribers, :title)
  end

  def find_subreddit
    @subreddit = Subreddit.find(params[:id])
  end
end
