class Person < ApplicationRecord
  belongs_to :zone
  has_many :coincidences, dependent: :destroy
  has_many :comments, through: :coincidences
end
