class HomepageController < ApplicationController
  def index
    @publications = Publication.all
  end
end
