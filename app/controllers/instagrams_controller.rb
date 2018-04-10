class InstagramsController < ApplicationController
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
      redirect_to instagrams_path
    else
      render :new
    end
  end



  def show
    @instagram = Instagram.find(params[:id])
  end

  def edit
    @instagram = Instagram.find(params[:id])
  end

  def update
    instagram = Instagram.find(params[:id])
    instagram.assign_attributes(instagram_params)
    if instagram.save
      redirect_to instagram_path(instagram)
    end
  end

  def delete
    Instagram.destroy(params[:id])
    #if delete works.delete
  end



  private
  def instagram_params
    return params.permit(:handle, :posts, :followers)
  end
end
