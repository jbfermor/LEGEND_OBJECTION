class Coincidence < ApplicationRecord
  belongs_to :comment
  belongs_to :person
end
