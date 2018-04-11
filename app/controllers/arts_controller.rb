class ArtsController < ApplicationController
  before_action :find_art, only: [:show, :edit, :update]


  def index
    @arts = Art.all

    @albums = Art.where(category: 'album')

    @books = Art.where(category: 'book')

    @movies = Art.where(category: 'movie')
  end

  def new
    @art = Art.new(category: params[:category], title: params[:title])
  end

  def create
    @art = Art.new(art_params)

    if @art.save
      flash[:success] = "Art created successfully"
      redirect_to art_path
    else
      flash.now[:failure] = "Validations Failed"
      render :new
    end
  end

  #Preferred style to indicate an intentional blank method
  def show; end

  def edit; end

  def update
    @art.assign_attributes(art_params)

    if @art.save
      redirect_to art_path(@art)
    else
      render :edit
    end
  end

  def destroy
    Art.destroy(params[:id])

    redirect_to arts_path
  end


  private

  #Strong Params
  def art_params
    return params.require(:art).permit(:category, :title, :creator, :pub_year, :description)
  end

  #Controller Filter
  def find_art
    @art = Art.find(params[:id])
  end

end

# TODO: Build successfully added/destroy grey message bar
