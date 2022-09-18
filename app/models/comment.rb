class Comment < ApplicationRecord
  belongs_to :comment_type
  has_and_belongs_to_many :people

  has_rich_text :description
end
