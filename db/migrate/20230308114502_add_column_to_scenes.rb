class AddColumnToScenes < ActiveRecord::Migration[7.0]
  def change
    add_column :scenes, :image_url, :string
  end
end
