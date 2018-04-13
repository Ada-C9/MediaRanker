class HomepageController < ApplicationController

  include PublicationsHelper
  before_action :find_user

  def index
    @publications = sort_by_votes(Publication.all.order(created_at: :asc))
  end
end
