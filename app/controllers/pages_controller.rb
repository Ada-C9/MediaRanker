class PagesController < ApplicationController
  def index
    # @works = Work.all
    @works = Work.sort_by_vote
  end
end
