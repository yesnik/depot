class Review < ActiveRecord::Base
  belongs_to :reviewable, polymorphic: true

  validates :author, :text, presence: true
end
