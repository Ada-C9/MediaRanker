require "test_helper"

describe WorksController do
  describe 'index' do
    
  end

  describe 'edit' do
    it 'responds with success if work exists' do
      work = Work.first
      get work_path(work.id)

      must_respond_with :success
    end

    it 'responds with not_found if work DNE' do
      nonexistent_work_id = Work.last.id + 1

      get work_path(nonexistent_work_id)

      must_respond_with :not_found
    end
  end

  describe 'update' do
    it 'can update a valid work' do
      work = Work.first
      work.title = 'My new title'

      work.valid?.must_equal true

      patch work_path(work.id), params: {work: {title: work.title}}
      must_respond_with :redirect
      must_redirect_to work_path(work.id)

      Work.first.title.must_equal 'My new title'
    end

    it "won't update an invalid work" do
      work = Work.first
      old_title = work.title
      work.title = nil

      work.valid?.must_equal false

      patch work_path(work.id), params: {work: {title: work.title}}

      must_respond_with :bad_request

      Work.first.title.must_equal old_title
    end

    it 'will return not_found if work DNE' do
      nonexistent_work_id = Work.last.id + 1

      get work_path(nonexistent_work_id)

      must_respond_with :not_found
    end
  end

  describe 'destroy' do
    it 'will remove a work if found' do
      work = Work.first
      old_count = Work.all.length

      delete work_path(work.id)

      Work.all.wont_include work
      Work.all.length.must_equal old_count - 1
    end
  end
end
