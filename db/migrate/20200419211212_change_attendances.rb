class ChangeAttendances < ActiveRecord::Migration[6.0]
  def change
    change_table :attendances do |t|

    end
  end
  add_index(:attendances, [:member_id, :event_id], :unique => true)
end
