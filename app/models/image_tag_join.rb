class ImageTagJoin < ActiveRecord::Base
  belongs_to :image, counter_cache: :tags_count
  belongs_to :tag, counter_cache: :images_count

  validates_uniqueness_of :image_id, scope: :tag_id
end
