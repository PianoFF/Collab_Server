class VocalSerializer < ActiveModel::Serializer
  attributes :id, :voice_type
  has_one :user
end
