class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :photos
         has_many :comments
         has_one_attached :avatar
         #has_many :images, as: :imageable
         enum :role, [:normal_user, :admin]
end
