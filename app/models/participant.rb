class Participant < ActiveRecord::Base

  belongs_to :person
  belongs_to :lanparty

  validates_presence_of :person_id, :lanparty_id

end
