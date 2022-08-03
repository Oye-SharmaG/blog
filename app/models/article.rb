class Article < ApplicationRecord
   has_many_attached :images
   has_many :comments
    
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
  end
  