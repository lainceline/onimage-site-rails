require 'securerandom'

class Image < ActiveRecord::Base

  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :tags

  validates :title, presence: true
  validates :original_filename, presence: true
  validates :uploaded_filename, presence: true

  def randomize_filename
    self.uploaded_filename = [SecureRandom.hex, self.original_filename.extension].join
  end

end


