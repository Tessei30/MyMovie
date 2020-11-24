class AddProfileImageIdToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :profile_image_id, :string
  end
end
