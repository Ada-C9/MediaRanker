class HomeController < ApplicationController
  def index
    @media = Work.all
  end
end
