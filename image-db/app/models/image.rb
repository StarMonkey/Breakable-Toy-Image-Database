class Image < ActiveRecord::Base
  mount_uploader :path, ImageUploader

  has_many :imagetags
  has_many :tags, :through => :imagetags
end
