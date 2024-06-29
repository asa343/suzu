class AddUserIdToApples < ActiveRecord::Migration[6.1]
  def change
    add_column :apples, :user_id, :integer
  end
end
