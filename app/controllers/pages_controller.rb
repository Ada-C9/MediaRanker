class PagesController < ApplicationController
  def index
    @hash = Work.make_category_hash
  end
end
