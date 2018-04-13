class VotesController < ApplicationController
  before_action :find_user

  def index
    @votes = Vote.all
  end

  def show
  end

  def new
  end

  def create
    # @user = User.find_by(id: session)
    # @work = Work.find_by(id: params[:work])

    # if @user
    #   @vote = Vote.new
    #   # @vote.user_name = @user
    #   # @vote.work = @work
    #   if @vote.save
    #     flash[:success] = "Successfully upvoted!"
    #     redirect_back(fallback_location: root_path)
    #   else
    #     flash[:failure] = "Could not upvote"
    #
    #     if @vote.errors.any?
    #       flash[:errors] = @vote.errors
    #     end
    #
    #     redirect_back(fallback_location: root_path)
    #   end
    # else
    #   flash[:failure] = "You must log in to do that"
    #   redirect_back(fallback_location: root_path)
    # end
    def create
      if !@user
        flash[:alert] = {user: "You must be logged in to vote"}
        redirect_back fallback_location: :works_path
      else
        @vote = Vote.create
        @vote.work_id = Work.find_by(id: params[:work_id]).id
        @vote.user_id = @user.id
        if @vote.save
          flash[:success] = "Successfully upvoted!"
          redirect_back fallback_location: :works_path
          #redirect_to root_path
        else
          flash[:alert] = @vote.errors
          redirect_to root_path
        end

      end
    end


  end

  def edit
  end

  def update
  end

  def destroy
  end

end
