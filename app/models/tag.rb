class Tag < ActiveRecord::Base

  has_and_belongs_to_many :images, counter_cache: true
  
end
