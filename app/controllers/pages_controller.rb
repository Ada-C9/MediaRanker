class PagesController < ApplicationController
  def index
    @works = Work.all
    @hash = Work.make_category_hash
    # @runs = Work.num_runs
  end
end
