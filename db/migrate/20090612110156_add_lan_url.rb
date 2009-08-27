class AddLanUrl < ActiveRecord::Migration
  def self.up
    add_column :lanparties, :url, :string
  end

  def self.down
    remove_column :lanparties, :url
  end
end
