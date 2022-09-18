class Comment < ApplicationRecord
  belongs_to :comment_type
  has_many :coincidences, dependent: :destroy
  has_many :people, through: :coincidences

end
