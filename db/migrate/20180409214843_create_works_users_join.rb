class CreateWorksUsersJoin < ActiveRecord::Migration[5.1]
  def change
    create_table :works_users_join do |t|
    t.belongs_to :work, index: true
    t.belongs_to :user, index: true

    t.timestamps
    end
  end
end
