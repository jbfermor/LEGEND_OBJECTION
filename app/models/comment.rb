class Comment < ApplicationRecord
  belongs_to :comment_type
  has_many :coincidences, dependent: :destroy
end
