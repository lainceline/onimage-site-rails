class AddNumImagesToTags < ActiveRecord::Migration
  def change
    add_column :tags, :num_images, :integer, { default: 0 }
  end
end
