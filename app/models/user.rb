class User < ActiveRecord::Base

  after_initialize :defaults

  has_many :images
  has_many :comments

  validates :name, presence: true
  validates :email, presence: true

  def defaults
    self.num_images = 0
  end

end
