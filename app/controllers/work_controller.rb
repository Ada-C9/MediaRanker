class WorkController < ApplicationController

  def index
    @works = Work.all
  end


end
