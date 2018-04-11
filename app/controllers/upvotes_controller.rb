class UpvotesController < ApplicationController
  def index
    @upvote = Upvote.all.order(params[:id])
  end

  def show
    @upvote = Upvote.all.find(params[:id])
  end

  def new
    @upvote = Upvote.new
  end

  def create
    @upvote = Upvote.new
    if @upvote.save
      redirect_to upvote_path(@upvote.id)
    else
      render :new
    end
  end

  # def upvote_params
  #   params.require(:upvote).permit(:work_title, :work_creator, :work_description, :work_category,
  #     :work_publication_year)
  #   end

end
