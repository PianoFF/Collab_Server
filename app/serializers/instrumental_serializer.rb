class InstrumentalSerializer < ActiveModel::Serializer
  attributes :id, :instrument
  has_one :user
end
