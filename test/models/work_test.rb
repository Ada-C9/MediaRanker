require "test_helper"

describe Work do
  # before do
  #   @post = Post.create!(name:'Awesome Post')
  # end
  before do
    @work = works(:four_hour_chef)
  end

  describe 'validations' do
    it 'has a title' do
      book_title = @work.title
      book_title.must_equal("The 4-Hour Chef")
    end

    it 'is invalid without a title' do
      work = Work.new(title: nil)

      result = work.valid?
      result.must_equal false
      work.errors.messages.must_include :title
    end

  end

  describe 'total votes' do
    it 'returns the total votes for a work' do
      # call total vote method on a work
      four_hour_chef_votes = [:vote1, :vote3]
      vote_count = four_hour_chef_votes.length

      total_votes = @work.total_work_vote

      total_votes.must_equal(3)
    end

    it 'returns the total votes for a user' do
    end

    it "spotlights the media with the most votes" do
      spotlight = @work.spotlight_work

      spotlight.must_equal(works(:four_hour_chef))
    end

  end

  # describe 'top media' do
    #   it 'returns top ten albums' do
    #   end
    #
    #   it 'returns top ten movies' do
    #   end
    #
    #   it 'can create a new work' do
    #   end
    # end
  # end

  #
  # describe 'relations' do
  #   it 'has a vote' do
  #   end
  #
  #   it 'can set a vote' do
  #   end
  # end
  #

end
