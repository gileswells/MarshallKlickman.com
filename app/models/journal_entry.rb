class JournalEntry < ActiveRecord::Base
  attr_accessible :content, :date
end
