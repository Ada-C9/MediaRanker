class VotesController < ApplicationController

  def index
    @votes = Vote.all
  end

  # def show
  #   id = params[:id]
  #   @vote = Vote.find(id)
  # end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(user_id: session[:user_id], work_id: params[:work_id])

    if @vote.save #it worked
      redirect_to work_path(@vote.work_id)
    else
      redirect_to works_path
    end
  end

  # def edit
  #   @vote = Vote.find_by(id: params[:id])
  #   if @vote.nil?
  #     redirect_to root_path
  #   end
  # end

  # def update
  #   @vote = Vote.find_by(id: params[:id])
  #   if !@vote.nil?
  #
  #     # Materials commented out because we are now using strong params.
  #     # @book.update(title: params[:book][:title], author: params[:book][:author], description: params[:book][:description])
  #
  #     if @vote.update(vote_params)
  #       redirect_to vote_path(@vote.id)
  #     else
  #       render :edit
  #     end
  #   else
  #     redirect_to votes_path
  #   end
  # end

  # def destroy
  #   id = params[:id]
  #   @vote = Vote.find(id)
  #
  #   if @vote.destroy #it worked
  #     redirect_to votes_path
  #   else
  #     render :destroy
  #   end
  # end

  private

  def vote_params
    # You don't need an explicit return here, but if it helps keep things straight in your head, it's okay to do it.
    params.require(:vote).permit(:vote, :user_id, :work_id)
  end
end
