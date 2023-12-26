class AddAuthlevelToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :auth_level, :string, default: 'user'
  end
end
