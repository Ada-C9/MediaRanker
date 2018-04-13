class WorksController < ApplicationController
  # before_action :find_user

  def index
    # @works = Work.all
    @works = Work.sort_by_vote
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    # @work.published.to_i
    if @work.save
      flash[:success] = "#{@work.title} created"
      redirect_to works_path
    else
      flash[:alert] = "Creation failed"
      flash.now[:error] = @work.errors.messages
      render :new
    end
  end

  def edit
    @work = Work.find_by(id: params[:id])
  end

  def update
    @work = Work.find_by(id: params[:id])
    if !@work.nil?
      if @work.update(work_params)
        flash[:success] = "#{@work.title} updated"
        redirect_to work_path(@work.id)
      else
        flash[:alert] = "#{@work.title} failed to update"
        flash.now[:error] = @work.errors.messages
        render :edit
      end
    else
      redirect_to works_path
    end
  end

  def show
    @work = Work.find_by(id: params[:id])
  end

  def destroy
    @work = Work.find_by(id: params[:id])
    if @work
      #iterate through works votes and delete
      @work.votes.each do |vote|
        vote.destroy
      end
      @work.destroy
    else
      flash[:alert] = "Failed to destroy work"
      redirect_to works_path
    end
    flash[:success] = "#{@work.title} deleted"
    redirect_to works_path
  end

  def upvote
    @work = Work.find_by(id: params[:id])
    if current_user != nil
      work_id = @work.id
      user_id = session[:user_id]
      @vote = Vote.new(work_id: work_id, user_id: user_id)
      if @vote.save
        flash[:success] = "Successfully Voted!"
        redirect_back fallback_location: :works_path
      else
        flash[:alert] = "Could not upvote"
        redirect_back fallback_location: :works_path
      end
    else
      flash[:alert] = "You must login to vote"
      redirect_to work_path(@work.id)
    end
  end

  private

  def work_params
    return params.require(:work).permit(:title, :description, :creator, :published, :category)
  end
end
