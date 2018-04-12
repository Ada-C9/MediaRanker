class PublicationsController < ApplicationController

  before_action :find_publication, only: [:show, :edit, :update, :destroy]
  before_action :find_user

  def index
    @publications = Publication.all.order(:category)
  end

  def show
  end

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.new(publication_params)
    # need to change categories to a constant that include Movie
    # and then right flash message: category: is not include in the list
    if @publication.save
      flash[:success] = "Successfully created book 489"
      redirect_to publication_path(@publication.id)
    else
      flash.now[:alert] = { "create #{@publication.category}" => @publication.errors }
      render :new
    end
  end

  def edit
  end

  def update
    # need to change categories to a constant that include Movie
    # and then right flash message: category: is not include in the list
    if @publication.update(publication_params)
      flash[:success] = "Successfully updated #{@publication.category} #{@publication.id}"
      redirect_to publication_path(@publication.id)
    else
      flash.now[:alert] = { "update #{@publication.category}" => @publication.errors }
      render :edit
    end
  end

  def destroy
    if !@publication
      flash[:alert] = "A problem occurred: Could not delete record that does not exist"
    else
      if !@publication.votes.empty?
        @publication.votes.each do | vote |
          vote.destroy
        end
      end
      if @publication.destroy
        flash[:success] = "Successfully destroyed #{@publication.category} #{@publication.id}"
        redirect_to root_path
      else
        flash.now[:alert] = { "delete #{@publication.category}" => @publication.errors }
        render :show
      end
    end
  end

  private

  def publication_params
    return params.require(:publication).permit(:category, :title, :creator, :publication_year, :description)
  end

  def find_publication
    @publication = Publication.find_by(id: params[:id])
  end
end
