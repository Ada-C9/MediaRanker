class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_votes = @user.votes
    @user_votes = (@user_votes.sort_by { |vote|
      vote.work.votes.count
    }).reverse
  end

end
