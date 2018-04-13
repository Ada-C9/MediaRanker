class VotesController < ApplicationController
  before_action :find_vote, only: [:show, :edit, :update, :destroy]
  before_action :find_active_user

  def index
  end

  def show
  end

  def new
    if @user.nil?
      flash[:alert] = "Please login to vote."
      redirect_to login_path
    else
      @vote = Vote.new
      create
    end
  end

  def create

    @vote = Vote.create(user_id: @user.id, work_id: params[:work_id])

    if @vote.save
      flash[:sucess] = "Vote saved"
      redirect_to works_path
    else
      flash.now[:alert] = "Media was not save."
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def find_vote
    # @vote = Vote.find_by_id(params[:id])
  end
end
