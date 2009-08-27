class AddLatLongToLan < ActiveRecord::Migration
  def self.up
    add_column :lanparties, :latitude, :string
    add_column :lanparties, :longitude, :string
  end

  def self.down
    remove_column :lanparties, :latitude
    remove_column :lanparties, :longitude
  end
end
