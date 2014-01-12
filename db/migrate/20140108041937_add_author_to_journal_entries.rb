class AddAuthorToJournalEntries < ActiveRecord::Migration
  def change
    add_column :journal_entries, :author, :string
  end
end
