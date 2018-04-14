require "test_helper"

describe Work do
  describe 'relations' do
    before do
      @work = Work.new(title: 'The Fifth Element')
    end

    it "vote connects work and user" do
      vote = Vote.first

      @work.votes << vote
      
      @work.votes_ids.must_include vote.id
    end
  end
end
