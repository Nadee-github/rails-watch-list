class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks
  # , dependent: :restrict

  validates :title, uniqueness: true, presence: true
  validates :overview, presence: true
end
