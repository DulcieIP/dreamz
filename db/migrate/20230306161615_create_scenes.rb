class CreateScenes < ActiveRecord::Migration[7.0]
  def change
    create_table :scenes do |t|
      t.references :dream, null: false, foreign_key: true
      t.string :image_url
      t.string :content

      t.timestamps
    end
  end
end
