class ArtsController < ApplicationController
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

  def show
    art_id = params[:id]

    @art = Art.find(art_id)
  end

  def edit
    @art = Art.find(params[:id])
  end


  private
  def art_params
    return params.require(:art).permit(:category, :title, :creator, :pub_year, :description)
  end
end
