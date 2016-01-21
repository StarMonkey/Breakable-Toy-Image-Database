class Tag < ActiveRecord::Base
  has_many :imagetags
  has_many :image, :through => :imagetags
end
