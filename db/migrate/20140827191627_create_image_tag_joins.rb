class CreateImageTagJoins < ActiveRecord::Migration
  def change
    create_table :image_tag_joins do |t|
      t.integer 'tag_id'
      t.integer 'image_id'
      t.timestamps
    end
  end
end
