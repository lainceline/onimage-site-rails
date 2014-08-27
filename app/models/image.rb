require 'securerandom'

class Image < ActiveRecord::Base

  belongs_to :user
  has_many :comments
  has_many :image_tag_join

  has_many :tags, through: :image_tag_join, counter_cache: true

  validates :title, presence: true
  validates :original_filename, presence: true
  validates :uploaded_filename, presence: true

  def randomize_filename
    self.uploaded_filename = [SecureRandom.hex, self.original_filename.extension].join
  end

end


