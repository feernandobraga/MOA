class AddAccessLevelToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :access_level, :string, default: nil
  end
end
