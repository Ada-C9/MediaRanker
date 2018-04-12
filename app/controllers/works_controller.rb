class WorksController < ApplicationController
  # before_action :find_user

  def index
    @works = Work.all
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
      flash[:alert] = {"#{@work.title}" => "creation failed"}
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
        flash[:alert] = {"#{@work.title}" => "failed to update"}
        # flash[:alert] = @work.errors
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
      @vote = Vote.create(work_id: work_id, user_id: user_id)
      flash[:success] = "Successfully Voted!"
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
