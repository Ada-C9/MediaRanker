class MainpageController < ApplicationController

  def index
    @works = Work.all
    @top = @works.order_by_vote.first
  end


end
