class AddNumtagsToImages < ActiveRecord::Migration
  def change
    add_column :images, :num_tags, :integer, { default: 0 }
  end
end
