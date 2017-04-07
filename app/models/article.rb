class Article < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_many :shouts
  has_many :hash_tags
  
end
