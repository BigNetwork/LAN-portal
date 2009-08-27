class CorrectLanUrl < ActiveRecord::Migration
  def self.up
    remove_column :lanparties, :url
    add_column :lanparties, :webpage, :string
  end

  def self.down
    add_column :lanparties, :url, :string
    remove_column :lanparties, :webpage
  end
end
