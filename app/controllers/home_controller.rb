class HomeController < ApplicationController
  def index
    @instagrams = Instagram.all
    @users = User.all
    @subreddits = Subreddit.all
    @twitters = Twitter.all
  end

  def show
  end

  def landingpage
    @instagrams = Instagram.all
    @subreddits = Subreddit.all
    @twitters = Twitter.all
  end

end
