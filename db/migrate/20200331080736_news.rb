class News < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.references :member, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
