class CreateParticipants < ActiveRecord::Migration
  def self.up
    create_table :participants do |t|
      t.integer :person_id
      t.integer :lanparty_id

      t.timestamps
    end
  end

  def self.down
    drop_table :participants
  end
end
