class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :member, null: false, foreign_key: true
      t.string :title
      t.string :address
      t.string :meeting_point
      t.datetime :time
      t.text :description

      t.timestamps
    end
  end
end
