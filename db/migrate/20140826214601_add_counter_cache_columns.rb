class AddCounterCacheColumns < ActiveRecord::Migration
  def change
    add_column :users, :num_images, :integer, { default: 0 }
    add_column :images, :num_comments, :integer, { default: 0 }
    add_column :images, :num_tags, :integer, { default: 0 }
  end
end
