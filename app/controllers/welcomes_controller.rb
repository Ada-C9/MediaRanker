class WelcomesController < ApplicationController
  def index
    @works = Work.all
  end
end
