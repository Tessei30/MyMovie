class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :movies
  has_many :favorites, dependent: :destroy
  has_many :movie_images
  has_many :movie_comments, dependent: :destroy

  attachment :profile_image

  validates :name, presence: true, uniqueness: true,
                  length: {minimum: 2, maximum: 20}
end
