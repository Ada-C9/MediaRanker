require "test_helper"

describe Work do
  describe 'relations' do
    it 'connects works and users' do
      user = User.create!
      work = Work.create!

      work.users << user
      work.user_ids.must_include user.id
    end

  end
end
