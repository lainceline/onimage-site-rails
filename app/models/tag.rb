class Tag < ActiveRecord::Base

  has_many :image_tag_join
  has_many :images, through: :image_tag_join, counter_cache: true
  
end
