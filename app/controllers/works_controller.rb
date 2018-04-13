class WorksController < ApplicationController
  before_action :find_work, only: [:show, :edit, :update,:destroy,:upvote]

  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      redirect_to works_path
    else
      flash[:alert] = "Could not create #{@work.category}"
      render :new
    end
  end

  def show
    work = find_work
    if work == nil
      flash[:alert] = "work was deleted"
      redirect_to works_path
    else
      @work = work
    end

  end

  def edit


  end


  def update
    if @work.update(work_params)
      flash[:success] = "#{@work.title} updated"
      redirect_to work_path(@work.id)
    else
      flash[:alert] = "A problem occured"
      render :edit
    end
  end
  def destroy
      current_user = nil
      if session[:user_id]
        current_user = User.find_by(id: session[:user_id])
        @work = Work.find(params[:id])
        @work.destroy

        flash[:message] = "Deleted #{@work.category} #{@work.title}"
        redirect_to works_path
      else
        flash[:status] = :failure
        flash[:alert] = "#{@work.category} #{@work.title} does not exists!"
        redirect_to works_path
        return
      end
    end
  # def destroy
  #   user = nil
  #   if session[:user_id]
  #     user =  User.find_by(id: session[:user_id])
  #     @work = Work.find(params[:id])
  #     @work.destroy
  #   else
  #     flash[:status] = :success
  #     flash[:message]= "Deleted #{@work.title}"
  #     redirect_to works_path
  #   end
  #   flash[:alert] = {work: "does not exist"}
  #
  #   redirect_to works_path
  #
  # end
  def upvote
    if !(session[:user_id])
      flash[:status] = :failure
      flash[:message] = "you must be logged in to do that"
      redirect_back fallback_location: {action: "index"}
    elsif  session[:user_id]
      @vote = Vote.new
      @vote.user = User.find(session[:user_id])
      @vote.work = Work.find_by(id: params[:id])
      @vote.date =  Date.today
      if @vote.save
        #flash[:status] = :success
        flash[:message] = "Successfully upvoted "
        redirect_back fallback_location: {action: "index"}
      else
        #flash[:status] =:failure
        flash[:message]= "Could not upvote.#{@user.username} has already upvoted for #{@work.title}"
        redirect_back fallback_location: {action: "index"}
      end
    end
  end

  private
  def work_params
    return params.require(:work).permit(:category, :title, :created, :publication_year, :description)
  end
  def find_work
    @work = Work.find_by(id: params[:id])

  end

end
