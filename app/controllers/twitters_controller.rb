class TwittersController < ApplicationController
  before_action :find_twitter, only: [:show, :edit, :update]
  def index
    @twitters = Twitter.all
  end

  def new
    @twitter = Twitter.new(id: params[:id])

  end

  def create
    @twitter = Twitter.new(twitter_params)


    if @twitter.save
      flash[:success] = "Twitter added successfully"
      redirect_to twitters_path
      #work.create
    else
      flash.now[:failure] = "Validations Failed"
      render :new
    end
  end

  def show;end

  def edit;end

  def update


    @twitter.assign_attributes(twitter_params)

    if twitter.save
      redirect_to twitter_path(twitter)
    else
      render :edit
    end
  end

  def destroy

    Twitter.destroy(params[:idea])

    redirect_to twitters_path
    #if delete works.delete
  end

  def upvote
    if session[:user_id]
      user_id = session[:user_id]

      @vote = Vote.new(user_id: user_id, twitter_id: params[:twitter_id])

      if @vote.save
        flash[:success] = "You voted!"
        redirect_to root_path
      else
        flash[:failure] = "You couldn't vote! Did you vote for this already?"
        redirect_to twitters_path
      end
    else
      flash[:failure] = "You need to be logged in to vote!"
    end
  end



  private
  def twitter_params
    params.require(:twitter).permit(:handle,:followers)
  end

  def find_twitter
    @twitter = Twitter.find(params[:id])
  end
end
