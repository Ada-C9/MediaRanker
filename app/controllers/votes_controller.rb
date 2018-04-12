class VotesController < ApplicationController
  before_action :find_user

  def index
  end

  def new
    @vote = Vote.new
    create
  end

  def destroy
  end

  def create
    @vote = Vote.create(user_id: @user.id, publication_id: params[:publication_id])

    if @vote.save
      flash[:success] = "Thank you for voting."
      redirect_back fallback_location: :main_path
    else
      flash.now[:alert] = @book.errors
      redirect_back fallback_location: :main_path
    end
  end

  def edit
  end

  def update
  end


end
