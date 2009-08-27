class Lanparty < ActiveRecord::Base

  has_many :participants
  has_many :people, :through => :participants

  validates_presence_of :title

end
