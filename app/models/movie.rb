class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks
  validates :title, :overview, presence: true
  before_destroy :check_bookmark_count

  private

  def check_bookmark_count
    if Bookmark.where(movie_id: self.id).exists?
        raise ActiveRecord::InvalidForeignKey
    end
  end
end
