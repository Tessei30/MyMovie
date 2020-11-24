class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.text :title
      t.text :body
      t.integer :user_id
      t.string :image_id

      t.timestamps
    end
  end
end
