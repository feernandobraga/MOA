class AddTimeToAttendance < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :time, :datetime
  end
end
