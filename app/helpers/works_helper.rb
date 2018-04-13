module WorksHelper

def category_from_url(fullpath)
  case fullpath
  when "/books", "/books/new"
    @content = [@books]
    @content_title = ["Books"]
  when "/movies", "/movies/new"
    @content = [@movies]
    @content_title = ["Movies"]
  when "/albums", "/albums/new"
    @content = [@albums]
    @content_title = ["Albums"]
  when "/works/new"
    render :new
  else
    @content = [@movies, @books, @albums]
    @content_title = ["Movies", "Books", "Albums"]
  end
end

end
