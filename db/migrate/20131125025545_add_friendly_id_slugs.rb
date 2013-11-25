class AddFriendlyIdSlugs < ActiveRecord::Migration
  
  def change
    add_column :posts, :slug, :string
    add_index :posts, :slug, :unique => true

    add_column :tags, :slug, :string
    add_index :tags, :slug, :unique => true
  end
end
