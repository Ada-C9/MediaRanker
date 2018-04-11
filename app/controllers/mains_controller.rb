class MainsController < ApplicationController
  def index
    @works = Work.all
  end
end
