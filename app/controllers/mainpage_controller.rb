class MainpageController < ApplicationController

  def index
    @works = Work.all
  end


end
