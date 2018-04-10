class PagesController < ApplicationController
  def index
    @hash = Work.make_category_hash
    # @runs = Work.num_runs
  end
end
