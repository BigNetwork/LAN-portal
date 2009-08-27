class CorrectLanUrlAgain < ActiveRecord::Migration
  def self.up
    rename_column :lanparties, :webpage, :website
  end

  def self.down
    rename_column :lanparties, :website, :webpage
  end
end
