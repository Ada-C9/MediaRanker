class HomepageController < ApplicationController
  def index
    @publications = Publication.all.order(:category)
  end
end
