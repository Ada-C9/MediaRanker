class WorksController < ApplicationController
	before_action :find_work, only:[:show, :edit, :update, :destroy]

	def index
		@all_works_sorted_in_categories = Work.get_top_in_all_categories_sorted
	end

	def show
	end

	def create
		@work = Work.new(work_params)
		if @work.save
			flash[:success] = "Successfully created #{@work.category} #{@work.id}"
			redirect_to work_path(id: @work.id)
		else
			flash[:alert] = @work.errors
			redirect_back(fallback_location: works_path)
		end
	end

	def new
		@category_list = CATEGORIES
		@work = Work.new
	end

	def edit
		@category_list = CATEGORIES
	end

	def update
		if @work
			@work.update(work_params)
	 		redirect_to work_path(params[:id])
		else
			redirect_to works_path
		end
	end

	def destroy
	 	if @work
		 	@work.votes.each { |vote| vote.destroy }
		  @work.destroy
			flash[:success] = "#{@work.title} deleted"
			redirect_to works_path
	 	else
		 flash[:alert] = "Work does not exist"
		 redirect_back fallback_location: works_path
	 	end
	end

	private

	def find_work
    @work = Work.find_by(id: params[:id])
  end

	def work_params
		return params.require(:work).permit(:id, :title, :category, :publication_year,
			:description, :creator)
	end

end
