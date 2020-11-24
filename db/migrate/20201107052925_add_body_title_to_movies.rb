class AddBodyTitleToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :body_title, :text
  end
end
