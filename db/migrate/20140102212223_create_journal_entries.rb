class CreateJournalEntries < ActiveRecord::Migration
  def change
    create_table :journal_entries do |t|
      t.date :date
      t.text :content

      t.timestamps
    end
  end
end
