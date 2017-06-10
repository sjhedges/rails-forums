class Post < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy
  # accepts_nested_attributes_for :comments, reject_if: :all_blank
end
