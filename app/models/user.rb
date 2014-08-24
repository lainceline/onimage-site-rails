class User < ActiveRecord::Base

  has_many :images
  has_many :comments

  validates :name, presence: true
  validates :email, presence: true

end
