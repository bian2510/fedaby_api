class Article < ApplicationRecord
  has_many :comment
  belongs_to :user
  validates_presence_of :title, :content, :user_id
end
