class TopTensController < ApplicationController
  def index
    works = Work.all

    # order works by vote count
    albums = works.where(category: "album")

    @top_albums = (albums[0..9].sort_by { |work| work.votes.count }).reverse!

    @top_work = (works.sort_by { |work| work.votes.count }).last
  end
end
