class RemoveNumimagesFromTags < ActiveRecord::Migration
  def change
    remove_column :tags, :num_images
  end
end
