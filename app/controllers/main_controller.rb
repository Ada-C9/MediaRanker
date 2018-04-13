class MainController < ApplicationController

  def index
    @works = Work.all
    @top_work = Work.top_work
  end

end
