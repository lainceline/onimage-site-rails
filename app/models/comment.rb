class Comment < ActiveRecord::Base

  belongs_to :image, counter_cache: true
  belongs_to :user, counter_cache: true

  validates :text, presence: true
  validates :user, presence: true
  validates :image, presence: true
end
