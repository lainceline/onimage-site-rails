class RemoveNumtagsFromImages < ActiveRecord::Migration
  def change
    remove_column :images, :num_tags
  end
end
