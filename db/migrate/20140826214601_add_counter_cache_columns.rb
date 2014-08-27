class AddCounterCacheColumns < ActiveRecord::Migration
  def change
    add_column :users, :images_count, :integer, { default: 0 }
    add_column :users, :comments_count, :integer, { default: 0 }
    add_column :images, :comments_count, :integer, { default: 0 }
    add_column :images, :tags_count, :integer, { default: 0 }
    add_column :tags, :images_count, :integer, { default: 0 }
  end
end
