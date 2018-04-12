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
    if @user
      if Vote.find_by(user_id: @user.id, publication_id: params[:publication_id]) == nil

        @vote = Vote.create(user_id: @user.id, publication_id: params[:publication_id])
        if @vote.save
          flash[:success] = "Thank you for voting"
          redirect_back fallback_location: :main_path
        else
          # this makes the error messages into a flash hash so it can be used by application.html.erb
          flash.now[:alert] = @vote.errors
          redirect_back fallback_location: :main_path
        end
      else
        flash[:success] = "You may not vote for an item more than once."
        redirect_back fallback_location: :main_path
      end
    else
      flash[:success] = "You must be logged in to vote"
      redirect_to login_form_path
    end
  end

  def edit
  end

  def update
  end


end
