class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :post_type, :content, :repertoire
  has_one :user
end
