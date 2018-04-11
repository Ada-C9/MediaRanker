class VotesController < ApplicationController
  before_action :find_vote, only: [:show, :edit, :update]

  def index
    @votes = Vote.all
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      redirect_to votes_path
    else
      # Validations failed! What do we do now? See below...
      render :new
    end

  end

  def show

    @works = Work.all

  end

  def edit; end

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

    redirect_to votes_path
  end

  private

  def vote_params
    return params.require(:vote).permit(:name)
  end

  def find_vote
    @vote = Vote.find(params[:id])
  end

end
