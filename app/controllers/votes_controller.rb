class VotesController < ApplicationController

  def create
    work = Work.find(params[:id])
    user = User.find(params[:id])
    @vote = Vote.create(work_id: work, user_id: user)
  end
end
