class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.timestamp :created

      t.timestamps
    end
  end
end
