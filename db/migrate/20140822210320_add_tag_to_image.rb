class AddTagToImage < ActiveRecord::Migration
  def change
    add_reference :images, :tag, index: true
  end
end
