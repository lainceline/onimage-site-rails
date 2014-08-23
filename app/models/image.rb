class Image < ActiveRecord::Base

  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :tags

  validates :title, presence: true
  validates :original_filename, presence: true
  validates :uploaded_filename, presence: true

end
