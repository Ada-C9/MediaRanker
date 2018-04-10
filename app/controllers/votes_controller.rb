class VotesController < ApplicationController
  def index
    @user = User.find_by(id:)
    @work = Work.find_by(id:)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
