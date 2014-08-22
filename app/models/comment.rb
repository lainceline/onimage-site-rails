class Comment < ActiveRecord::Base

  belongs_to :image
  belongs_to :user

  validates :text, presence: true
  validates :user, presence: true
  validates :image, presence: true
end
