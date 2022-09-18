class Person < ApplicationRecord
  belongs_to :zone
  has_many :coincidences, dependent: :destroy
end
