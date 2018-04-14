class HomepageController < ApplicationController
before_action :find_user
  def index
    @votes_hmp = Vote.all
  end


end
