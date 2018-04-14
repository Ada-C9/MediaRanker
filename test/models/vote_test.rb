require "test_helper"

describe Vote do
  let(:user) {User.create(name:"Noe Body")}
  let(:work) {Work.find_by(title:"Sound of Nigera")}
  let(:vote) {Vote.create(user_id: user.id, work_id: work.id)}

  it "must be valid" do
    value(vote).must_be :valid?
  end

  it 'must display expected values' do
    a_vote.user_id.must_equal user.id
    a_vote.work_id.must_equal work.id
  end

  it 'must be able to display associated users' do
    vote.users[0].name.must_equal "Noe Body"
  end

  it 'must be able to display associated works' do
    vote.works[0].title.must_equal "Sound of Nigera"
  end
end
