class Question < ActiveRecord::Base
  attr_accessible :inquiry, :poll_id
  
  validates :inquiry, :presence => true
  
  belongs_to :poll
  has_many :responses
end
