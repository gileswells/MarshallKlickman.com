class JournalEntry < ActiveRecord::Base
  attr_accessible :content, :date, :author

  validates :author, :presence => true
  validates :content, :presence => true
end
