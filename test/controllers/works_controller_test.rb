require "test_helper"

describe WorksController do

  describe 'index' do
    it 'sends success if many works' do
      Work.count.must_be :>,0

      get works_path
      must_respond_with :success
    end

    # it 'sends success if no works' do
    #   Work.destroy_all
    #
    #   get works_path
    #   must_respond_with :success
    # end
  end

  describe 'show' do
    it 'sends success if the work exists' do
      get work_path(works(:kindred).id)
      must_respond_with :success
    end

    it 'sends not_found if the work doesnt exist' do
      work_id = Work.last.id + 1
      get work_path(work_id)
      must_respond_with :not_found
    end
  end

  describe 'edit' do
    it 'sends success if the works' do
      get edit_work_path(works(:kindred).id)
      must_respond_with :success
    end

    it 'sends not_found if the work doesnt exist' do
      work_id = Work.last.id + 1
      get edit_work_path(work_id)
      must_respond_with :not_found
    end
  end

  describe 'update' do
    it 'updates the work if it exists and valid updates are requested' do
      # work = works(:kindred)
      # work_data = work.attributes
      # work_data[:title] = "Revised Kindred"
      #
      # work.assign_attributes(work_data)
      # work.must_be :valid?
      #
      # patch work_path(work), params: {work: work_data}
      #
      # must_redirect_to work_path(work)
      # work.reload
      # works(:kindred).title.must_equal work_data[:title]

      work = works(:kindred)
      work.title = "Revised Kindred"

      work.must_be :valid?

      patch work_path(work), params: {work: work.attributes}

      must_redirect_to work_path(work)
      work.reload
      works(:kindred).title.must_equal work.title
    end

    it 'sends bad_request if work exists but invalid updates are requested' do
      work = works(:kindred)
      work.title = ""

      work.wont_be :valid?

      patch work_path(work), params: {work: work.attributes}

      must_respond_with :bad_request
    end

    it 'sends not_found if the work doesnt exist' do
      work_id = Work.last.id + 1
      get edit_work_path(work_id)
      must_respond_with :not_found
    end
  end

  describe 'new' do
    # don't need tests for books/no books bc this only gets form
    it 'sends success' do
      get new_work_path
      must_respond_with :success
    end
  end

  describe 'create' do
  end

  describe 'destroy' do
  end

  describe 'upvote' do
  end

end
