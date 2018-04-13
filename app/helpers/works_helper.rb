module WorksHelper

def category_from_url(fullpath)
  case fullpath
  when "/books"
    @content = [@books]
    @content_title = ["Books"]
  when "/movies"
    @content = [@movies]
    @content_title = ["Movies"]
  when "/albums"
    @content = [@albums]
    @content_title = ["Albums"]
  else
  end
end

end
