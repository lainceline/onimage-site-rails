require 'securerandom'

class Image < ActiveRecord::Base

  after_initialize :defaults

  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :tags

  validates :title, presence: true
  validates :original_filename, presence: true
  validates :uploaded_filename, presence: true

  def defaults
    self.num_tags ||= 0
  end

  def randomize_filename
    self.uploaded_filename = [SecureRandom.hex, self.original_filename.extension].join
  end

end


