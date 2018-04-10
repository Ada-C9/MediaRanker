class ArtsController < ApplicationController
  def index
    @arts = Art.all

    @albums = Art.where(category: 'album')

    @books = Art.where(category: 'book')

    @movies = Art.where(category: 'movie')
  end
end
