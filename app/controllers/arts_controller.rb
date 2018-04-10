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

  def update
    @art = Art.find(params[:id])

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
  def art_params
    return params.require(:art).permit(:category, :title, :creator, :pub_year, :description)
  end
end
