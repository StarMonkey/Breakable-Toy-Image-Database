class Image < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :user
      t.string :path
    end
  end
end
