class WorksController < ApplicationController


  def index
    @movies = Work.where(category: 'movie')
    @books = Work.where(category: 'book')
    @albums = Work.where(category: 'album')
  end

  def show
    @work = Work.find_by(id: params[:id])
    @votes = @work.votes
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:success] = "Succesfully created #{@work.category} #{@work.title}."
      redirect_to work_path(@work.id)
    else
      flash.now[:alert] = @work.errors
      render :new
    end
  end

  def edit
    @work = Work.find_by(id: params[:id])
  end

  def update
    @work = Work.find_by(id: params[:id])
    if @work
      if @work.update(work_params)
        flash[:success] = "#{@work.title} updated"
        redirect_to work_path
      else
        render :edit
      end
    end
  end

  def destroy
    @work = Work.find_by(id: params[:id])

    if @work
      if !@work.votes.empty?
        @work.votes.each do | vote |
          vote.destroy
        end
      end
      if @work.destroy
        flash[:success] = "Successfully destroyed #{@work.category} #{@work.title}"
        redirect_to root_path
      else
        flash.now[:alert] = { "delete #{@work.category}" => @work.errors }
        render :show
      end
    else
      flash[:alert] = "Work does not exist"
      redirect_to root_path
    end
  end


  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year)
  end

end
