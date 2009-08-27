class CreateLanparties < ActiveRecord::Migration
  def self.up
    create_table :lanparties do |t|
      t.string :title
      t.text :description
      t.timestamp :start
      t.timestamp :end
      t.integer :added_by

      t.timestamps
    end
  end

  def self.down
    drop_table :lanparties
  end
end
