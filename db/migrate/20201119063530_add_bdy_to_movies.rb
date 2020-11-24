class AddBdyToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :bdy, :text
  end
end
