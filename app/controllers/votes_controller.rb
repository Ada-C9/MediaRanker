class VotesController < ApplicationController
  before_action :find_vote, only: [:show, :edit, :update, :destroy]
  before_action :find_active_user

  def index
  end

  def show
  end

  def new
    @vote = Vote.new
    # @vote.creator = Work.find(params[:creator_id])
    create
  end

  def create
    @vote = Vote.create(user_id: @user.id, work_id: params[:work_id])
    # @vote = Vote.new
    # @vote.creator = Work.find(params[:creator_id])
    # @vote.creator = @work.creator

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
