class CreateWorksVotesJoin < ActiveRecord::Migration[5.1]
  def change
    create_table :works_votes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :vote, index: true
    end
  end
end
