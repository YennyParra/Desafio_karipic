class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  belongs_to :users
  has_one_attached :images
 
end
