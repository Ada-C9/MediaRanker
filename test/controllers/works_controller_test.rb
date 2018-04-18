require "test_helper"

describe WorksController do
  it "should get index" do
    get works_path
    must_respond_with :success
  end

  it "should get show" do
    get work_path(works(:pride).id)
    must_respond_with :success
  end

  it "should get new" do
    get new_work_path
    must_respond_with :success
  end

  it "can create a new work" do
    proc {
      post works_path, params: {
        work: {
          title: "Book title",
          creator: "An author",
          category: "Book",
          publication_year: 1984
        }
      }
    }.must_change "Work.count", 1

    must_respond_with :redirect
    must_redirect_to works_path
  end

  it "should get edit" do
    get edit_work_path(works(:pride).id)
    must_respond_with :success
  end

  it "can update a work" do
    updated_title = "deeface"

    put work_path(works(:itonya).id), params: {
      work: {
        title: "deeface"
      }
    }

    updated_work = Work.find(works(:itonya).id)
    updated_work.title.must_equal updated_title

    must_respond_with :redirect
  end

  # it "should get update" do
  #   get works_update_url
  #   value(response).must_be :success?
  # end
  #
  # it "should get destroy" do
  #   get works_destroy_url
  #   value(response).must_be :success?
  # end

end
