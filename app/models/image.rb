class Image < ActiveRecord::Base

  validates :title, presence: true
  validates :original_filename, presence: true
  validates :uploaded_filename, presence: true

end
