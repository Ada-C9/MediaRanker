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



  private
  def twitter_params
    params.require(:twitter).permit(:handle,:followers)
  end

  def find_twitter
    @twitter = Twitter.find(params[:id])
  end
end
