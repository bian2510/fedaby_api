class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :image, :username, :created_at, :comments
  def username
    object.user.username
  end

  def comments
    #pendiente
  end
end