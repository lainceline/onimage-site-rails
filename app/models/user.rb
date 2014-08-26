class User < ActiveRecord::Base

  has_many :images, counter_cache: true
  has_many :comments, counter_cache: true

  validates :name, presence: true
  validates :email, presence: true

end
