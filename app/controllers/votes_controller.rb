class VotesController < ApplicationController
  # before_action :find_user

  def index
  end

  def new
    @vote = Vote.new

    create
  end

  def destroy
  end

  def create
    # Tried to move this logic to model, but didn't make sense b/c of flash messages
    if @user
      if Vote.find_by(user_id: @user.id, publication_id: params[:publication_id]) == nil
        @vote = Vote.create(user_id: @user.id, publication_id: params[:publication_id])
        if @vote.save
          flash[:success] = "Thank you for voting"
          redirect_back fallback_location: :main_path
        else
          flash.now[:alert] = @vote.errors
          redirect_back fallback_location: :main_path
        end
      else
        flash[:fail] = "You may not vote for an item more than once."
        redirect_back fallback_location: :main_path
      end
    else
      flash[:fail] = "You must be logged in to vote"
      redirect_to login_form_path
    end
  end


end
