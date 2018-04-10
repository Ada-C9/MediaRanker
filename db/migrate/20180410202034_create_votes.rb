class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      add_reference :votes, :user, forgin_key: true
      add_reference :votes, :work, forgin_key: true
      t.timestamps
    end
  end
end
