require "test_helper"

describe WorksController do
  describe 'index' do
    it "should get index" do
      get works_path
      value(response).must_be :success?
    end
  end

  describe 'new' do
    it 'responds with success' do
      get new_work_path
      must_respond_with :success
      # Don't need to test with no works because this action doesn't even look at the DB
    end
  end

  describe 'create' do
    it 'can add a valid work' do
      work_data = {
        title: "The Bends",
        creator: "Radiohead",
        publication_year: 1995,
        category: "album"
      }
      old_work_count = Work.count

      Work.new(work_data).must_be :valid?

      post works_path, params: { work: work_data }

      must_respond_with :redirect
      must_redirect_to works_path

      # Next two lines are checking the DB???
      Work.count.must_equal old_work_count + 1
      Work.last.title.must_equal work_data[:title]
    end

    it 'wont add an invalid work' do
      # Arrange
      old_work_count = Work.count

      # Assumptions
      invalid_work = Work.new
      invalid_work.wont_be :valid?

      # invalid_work has all nil attributes at this point
      bad_params = invalid_work.attributes

      # Act
      post works_path, params:{ work: bad_params}

      # Assert
      must_respond_with :bad_request # <--instead of :error
      flash[:notice][0].must_include "Title can't be blank"
      Work.count.must_equal old_work_count
    end
  end

  describe 'show' do
    it 'sends success if the work exists' do
      get work_path(Work.first)
      must_respond_with :success
    end

    it 'sends not_found if the work doesnt exist' do
      # work.destroy_all
      # then pass a book so to guarantee there won't be one
      # Get an invalid work ID somehow - many ways to do it
      work_id = Work.last.id + 1

      get work_path(work_id)

      # can also try ":missing" instead of ":not_found"
      must_respond_with :not_found
      # FYI with this test we changed the "find_work" private method inside the works_controller
    end
  end

end
