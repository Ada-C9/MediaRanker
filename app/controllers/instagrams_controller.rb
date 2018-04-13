class InstagramsController < ApplicationController
  before_action :find_instagram, only:[:show, :edit, :update]
  def index
    @instagrams = Instagram.all
  end


  def new
    @instagram = Instagram.new
  end

  def create
    @instagram = Instagram.new(instagram_params)

    if @instagram.save
      #works.create
      flash[:success] = "Instagram added successfully"
      redirect_to instagrams_path
    else
      flash.now[:failure]= "Validations failed."
      render :new
    end
  end



  def show;end

  def edit;end

  def update

    @instagram.assign_attributes(instagram_params)
    if @instagram.save
      redirect_to instagram_path(instagram)
    else
      render :edit
    end
  end

  def delete
    Instagram.destroy(params[:id])
    #if delete works.delete

    redirect_to instagrams_path
  end

  def upvote
    if session[:user_id]
      user_id = session[:user_id]

      @vote = Vote.new(user_id: user_id, instagram_id: params[:instagram_id], subreddit_id: nil, twitter_id: nil)

      if @vote.save
        flash[:success] = "You upvoted!"
        redirect_to root_path
      else
        flash[:failure] = "You couldn't vote! Have you already voted for this?"
        redirect_to instagrams_path
      end
    else
      flash.now[:failure] = "You need to be logged in to vote!"
    end
  end


  private
  def instagram_params
    return params.require(:instagram).permit(:handle, :posts, :followers)
  end

  def find_instagram
    @instagram = Instagram.find(params[:id])
  end
end
