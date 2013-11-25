class Post < ActiveRecord::Base
  attr_accessible :content, :title, :tag_list, :draft, :featured_image_url

  extend FriendlyId
  friendly_id :title, :use => :slugged
  acts_as_taggable

end
