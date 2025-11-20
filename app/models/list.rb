class List < ApplicationRecord
  # should destroy child bookmarks when destroying self
  # (in other words, should remove movies from the list when it is deleted)
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  # name cannot be blank
  # name is unique
  validates :name, presence: true, uniqueness: true
end
