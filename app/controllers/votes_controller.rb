class VotesController < ApplicationController

  def create
    work = Work.find(params[:work_id])
    user = User.find(session[:user_id])
    @vote = Vote.create(work_id: work.id, user_id: user.id)
    puts ">>>>> #{@vote.errors.messages}"
  end


end
