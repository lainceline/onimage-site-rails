class Image < ActiveRecord::Base

  belongs_to :user
  has_many :comments

  validates :title, presence: true
  validates :original_filename, presence: true
  validates :uploaded_filename, presence: true

end
