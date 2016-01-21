class Image < ActiveRecord::Base
  has_many :imagetags
  has_many :tags, :through => :imagetags
end
