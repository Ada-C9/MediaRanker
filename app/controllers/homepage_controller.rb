class HomepageController < ApplicationController

  def index
    @votes_hmp = Vote.all
  end


end
