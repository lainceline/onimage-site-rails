class Tag < ActiveRecord::Base
  has_many :images, through: :imagestags
end
