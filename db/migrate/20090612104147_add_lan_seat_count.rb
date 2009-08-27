class AddLanSeatCount < ActiveRecord::Migration
  def self.up
    add_column :lanparties, :seats, :integer
  end

  def self.down
    remove_column :lanparties, :seats
  end
end
