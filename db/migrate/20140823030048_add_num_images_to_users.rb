class AddNumImagesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :num_images, :integer, { default: 0 }
  end
end
