class AddAuthenticationTokenToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :authentication_token, :string, limit: 30
    add_index :members, :authentication_token, unique: true
  end
end
