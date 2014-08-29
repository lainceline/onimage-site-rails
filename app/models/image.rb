require 'securerandom'

class Image < ActiveRecord::Base

  after_validation :randomize_filename

  belongs_to :user, counter_cache: true
  has_many :comments
  has_many :image_tag_join

  has_many :tags, through: :image_tag_join

  validates :title, presence: true
  validates :original_filename, presence: true

  def randomize_filename
    if self.original_filename
      self.uploaded_filename = [SecureRandom.hex, self.original_filename.extension].join
    end
  end

end