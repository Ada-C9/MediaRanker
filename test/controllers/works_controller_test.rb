require "test_helper"

describe WorksController do

  describe "index" do

    it 'shows all the works' do
      Work.count.must_be :>, 0

      get works_path

      must_respond_with :success
    end

    it 'sends success response when there are no works' do
      Work.destroy_all

      get works_path

      must_respond_with :success
    end
  end

  describe "new" do
    it 'responds with success' do
      get new_work_path

      must_respond_with :success
    end
  end

  describe "create" do
    it 'responds with success' do

      work_data = {
        category: "movie",
        title: "Some Work",
      }

      # Test assumptions
      Work.new(work_data).must_be :valid?

      old_work_count = Work.count

      # Act
      post works_path params: { work: work_data }

      # Assert
      must_respond_with :redirect
      must_redirect_to works_path

      Work.count.must_equal old_work_count + 1
      Work.last.title.must_equal work_data[:title]
    end

    it "won't add an invalid work" do
      work_data = {
        title: ""
      }

      # Test assumptions
      Work.new(work_data).wont_be :valid?

      old_work_count = Work.count

      # Act
      post works_path params: { work: work_data }

      # Assert
      must_respond_with :bad_request

      Work.count.must_equal old_work_count
    end
  end

  describe "Show" do
    it "success if work is found" do

      work = Work.first

      get work_path(work)

      must_respond_with :success

    end

    it "Sends back not_found if no work" do

      work_id = Work.last.id + 1

      get work_path(work_id)

      must_respond_with :not_found

    end
  end

  describe "Edit" do
    it "success if work is edited" do

      work = Work.first

      get edit_work_path(work)

      must_respond_with :success

    end

    it "Sends back not_found if no work" do

      work_id = Work.last.id + 1

      get edit_work_path(work_id)

      must_respond_with :not_found

    end
  end

  describe "update" do
    it 'updates successfully' do

      work = Work.first

      work_data = work.attributes

      work_data[:title] = "Some updated title"


      work.assign_attributes(work_data)
      work.must_be :valid?

      # Act

      patch work_path(work), params: { work: work_data }

      # Assert
      must_respond_with :redirect
      must_redirect_to work_path(work)

      work.reload

      work.title.must_equal work_data[:title]
    end

    it "won't update an invalid work" do
      work = Work.first

      work_data = {
        title: ""
      }

      # Test assumptions
      Work.new(work_data).wont_be :valid?

      old_work_count = Work.count

      # Act
      post works_path(work), params: { work: work_data }

      # Assert
      must_respond_with :bad_request

      Work.count.must_equal old_work_count
    end
  end


  describe "Destroy" do
    it "success if work is deleted" do

      work = Work.first

      old_work_count = Work.count

      delete work_path(work)

      must_respond_with :found
      Work.count.must_equal old_work_count - 1

    end

    it "Sends back not_found if no work" do

      work_id = Work.last.id + 1

      get edit_work_path(work_id)

      must_respond_with :not_found

    end
  end

end
