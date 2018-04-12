class PagesController < ApplicationController

  # before_action :find_user

  def index
    @works = Work.all
  end
end
