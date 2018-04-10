class AddRelationshipToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :vote, foreign_key: true
  end
end
