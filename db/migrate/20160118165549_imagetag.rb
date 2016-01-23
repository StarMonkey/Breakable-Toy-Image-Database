class Imagetag < ActiveRecord::Migration
  def change
    create_table :imagetags do |t|
      t.belongs_to :tag
      t.belongs_to :image
    end
  end
end
