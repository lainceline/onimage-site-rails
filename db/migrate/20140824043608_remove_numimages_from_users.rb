class RemoveNumimagesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :num_images
  end
end
