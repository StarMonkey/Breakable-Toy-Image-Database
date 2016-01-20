class Imagetag < ActiveRecord::Base
  has_one :image
  has_one :tag
end
