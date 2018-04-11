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
    @publication = Publication.find(params[:id])
    @publication.destroy if @publication
    redirect_to publications_path
  end

  def new
    @publication = Publication.new
  end

  def edit
    @publication = Publication.find(params[:id])
  end

  def update
    @publication = Publication.find_by(id: params[:id])
    if !@publication.nil?
      @publication.update(publication_params) ? (redirect_to publication_path(@publication.id)) : (render :edit)
    else
      redirect_to publications_path
    end
  end

  private

  def publication_params
  return params.require(:publication).permit(:title, :creator, :category, :publication_year, :description)
end
end
