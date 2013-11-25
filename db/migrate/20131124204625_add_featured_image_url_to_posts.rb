class AddFeaturedImageUrlToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :featured_image_url, :string
  end
end
