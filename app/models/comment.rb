class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates_presence_of :body, :user_id, :article_id
end
