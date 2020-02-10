class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :post_type, :content, :repertoire, :created_at
  has_one :user, serializer: PublicUserSerializer
end
