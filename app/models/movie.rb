class Movie < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :movie_comments, dependent: :destroy

  attachment :profile_image


	validates :title, presence: true
	validates :body_title, length: { maximum: 20 }
  validates :bdy , presence: true
  validates :bdy , length: { maximum: 200 }

  def self.search(search)
    return Movie.all unless search
    Movie.where('title LIKE(?)', "%#{search}%")
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
