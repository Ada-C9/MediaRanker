class HomepageController < ApplicationController

  before_action :find_user

  def index
    @publications = Publication.all.order(:category)
  end
end
