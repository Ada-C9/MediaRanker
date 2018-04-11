class PublicationsController < ApplicationController
  def index
    @albums = Publication.where(category: "album")
    @books = Publication.where(category: "book")
    @movies = Publication.where(category: "movie")
  end

  def show
    @publication = Publication.find(params[:id])

  end

  def create
    @publication = Publication.new(publication_params)
    @publication.save ? (redirect_to publication_path(@publication[:id])) : (render :new)
  end

  def destroy
  end

  def new
    @publication = Publication.new

  end

  def edit
  end

  def update
  end

  private

  def publication_params
  return params.require(:publication).permit(:title, :creator, :category, :publication_year, :description)
end
end
