class CreateWorksUsersJoin < ActiveRecord::Migration[5.1]
  def change
    create_table :works_users_joins do |t|
      t.belongs_to :work, index: true
      t.belongs_to :user, index: true
    end
  end
end
