class Movie < ApplicationRecord
  # should not be able to destroy self if has bookmarks children
  # before_destroy :cannot_destroy_if_has_bookmarks

  has_many :bookmarks #, dependent: :destroy
  # title is unique
  # title cannot be blank
  validates :title, presence: true, uniqueness: true
  # overview cannot be blank
  validates :overview, presence: true

  # private

  # ----> This method is uneccesary, as the logic is already happening under the hood.
  # def cannot_destroy_if_has_bookmarks
  #   if bookmarks.any?
  #     # errors.add_to_base("Cannot delete movie with bookmarks")
  #     raise ActiveRecord::InvalidForeignKey
  #   end
  # end
end
