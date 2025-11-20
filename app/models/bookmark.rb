class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  # comment cannot be shorter than 6 characters
  # is unique for a given movie/list couple
  validates :comment, presence: true, length: { minimum: 6 }
  validates :movie_id, uniqueness: { scope: :list_id }
end
