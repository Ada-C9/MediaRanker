class MainsController < ApplicationController

  def index
    @works = Work.top_most_work
  end
end
