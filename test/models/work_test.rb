require "test_helper"

describe Work do


  it "must be valid" do
    work = Work.new(:category=>"album",:title=> "liquidspirit")
    work.must_be :valid?
  end

  it "reqiures a title" do
    work = Work.new
    work.wont_be :valid?
    work.errors.messages.must_include :title
  end

  it "requires a category" do
    work = Work.new
    work.wont_be :valid?

    work.errors.messages.must_include :category
  end

end

describe "relations" do
  it "responds to votes and can be voted on once " do
    work = Work.new(:book1)
    work.must_respond_to :votes
    work.votes.must_be :empty?
    work.votes.must_equal 0
    vote = Vote.create(work_id: work.id,user_id: users(:user4).id,date:2018-04-13)

    work.votes << vote

    work.votes.count.must_equal 1
    work.votes.must_include vote
  end
  end
