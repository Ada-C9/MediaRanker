class ArtsController < ApplicationController
  before_action :find_art, only: %I[show edit update]

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
    @art = Art.create art_params

    if @art.id != nil
      flash[:success] = 'Art created successfully'
      redirect_to arts_path
    else
      flash.now[:failure] = 'Validations Failed'
      render :new
    end
  end

  # Preferred style to indicate an intentional blank method
  def show
    @votes = @art.votes.order(created_at: :desc)
  end

  def edit; end

  def update
    @art.assign_attributes(art_params)

    if @art.save
      flash[:status] = :success
      flash[:result_text] = "Successfully updated #{@art.name} #{art.id}."
      redirect_to art_path(@art)
    else
      flash[:status] =:failure
      flash[:result_text] = "Could not update #{@art.name}"
      flash.now[:messages] = @art.errors.messages
      render :edit, status: :not_found
    end
  end

  def destroy
    Art.destroy(params[:id])

    redirect_to arts_path
    # TODO: ADD FLASH ALERTS
  end

  def upvote
    flash[:staus] = :failure
    if @login_user
      vote = Vote.new(user: @login_user, art: @art)
      if vote.save
        flash[:status] = :success
        flash[:result_text] = "Successfully voted!"
        status = :found
      else
        flash[:result_text] = "Could not upvote."
        flash[:messages] = vote.errors.messages
        status = :conflict
      end
    else
      flash[:result_text] = "You must log in to do that..."
      status = :unauthorized
    end
    redirect_to arts_path
  end

  private

  # Strong Params
  def art_params
    params.require(:art).permit(:category, :title, :creator, :pub_year, :description)
  end

  # Controller Filter
  def find_art
    @art = Art.find(params[:id])
  end
end
