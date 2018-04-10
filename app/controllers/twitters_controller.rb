class TwittersController < ApplicationController
  def index
    @twitters = Twitter.all
  end

  def new
    @twitter = Twitter.new(id: params[:id])

  end

  def create
    @twitter = Twitter.new(twitter_params)


    if @twitter.save
      redirect_to twitters_path
      #work.create
    else
      render :new
    end
  end

  def show
    @twitter = Twitter.find(params[:id])
  end

  def edit
    @twitter = Twitter.find(params[:id])
  end

  def update
    twitter = Twitter.find(params[:id])

    twitter.assign_attributes(twitter_params)

    if twitter.save
      redirect_to twitter_path(twitter)
    end
  end

  def destroy
    twitter = Twitter.find(params[:id])

    if twitter.destroy
      redirect_to twitters_path
      #if delete works.delete
    end
  end


  private
  def twitter_params
    params.permit(:handle,:followers)
  end
end
