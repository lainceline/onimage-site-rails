class Tag < ActiveRecord::Base

  after_initialize :defaults

  has_and_belongs_to_many :images

  def defaults
    self.num_images ||= 0
  end

end
