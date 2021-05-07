class List < ApplicationRecord
  acts_as_taggable_on :tags
  has_many :bookmarks, dependent: :delete_all
  has_many :movies, through: :bookmarks

  validates :name, uniqueness: true, presence: true
end
