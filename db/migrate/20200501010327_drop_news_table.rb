class DropNewsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :news
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end
