class PublicationsController < ApplicationController

  before_action :find_user
  
  def index
    @publications = Publication.all.order(:category)
  end

  def show
    @publication = Publication.find(params[:id])
  end

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.new(publication_params)
    if @publication.save
      redirect_to publication_path(@publication.id)
    else
      render :new
    end
  end

  def edit
    @publication = Publication.find(params[:id])
  end

  def update
    @publication = Publication.find(params[:id])
    if @publication.update(publication_params)
      redirect_to publication_path(@publication.id)
    else
      render :edit
    end
  end

  def destroy
    @publication = Publication.find(params[:id])
    if @publication.destroy
      redirect_to publications_path
    else
      render :show
    end
  end

  private

  def publication_params
    return params.require(:publication).permit(:category, :title, :creator, :publication_year, :description)
  end
end
