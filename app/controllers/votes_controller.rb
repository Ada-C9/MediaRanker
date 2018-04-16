class VotesController < ApplicationController
  before_action :find_vote, only: [:show, :edit, :update]

  def new
    @vote = Vote.new
  end

  def show ; end

  def edit ; end

  def create
    if session[:user_id]
      new_vote = {
        user_id: session[:user_id],
        work_id: params[:work_id]
      }
      @vote = Vote.new(new_vote)
      if @vote.save
        flash[:success] = "You have successfully voted"
      else
        flash[:alert] = "Vote did not save"
        flash[:notice] = @vote.errors.full_messages
      end
    else
      flash[:notice] = "You must be log in to do that"
    end
    redirect_to works_path
  end

  def update
    @vote.assign_attributes(vote_params)

    if @vote.save
      redirect_to vote_path(@vote)
    else
      render :edit
    end
  end

  def destroy
    Vote.destroy(params[:id])
    redirect_to users_path
    flash[:alert] = "Vote Deleted"
  end

  private

  def vote_params
    return params.require(:vote).permit(:user_id, :work_id)
  end

  def find_vote
    @vote = Vote.find(params[:id])
  end

end
