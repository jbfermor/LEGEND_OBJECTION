class Person < ApplicationRecord
  belongs_to :zone
  has_and_belongs_to_many :comments
end
