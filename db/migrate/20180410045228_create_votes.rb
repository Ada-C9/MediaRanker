class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.belongs_to :work, index: true
      t.belongs_to :user, index: true
      t.datetime :voted_date

      t.timestamps
    end
  end
end
