class LocationSerializer < ActiveModel::Serializer
  attributes :id, :street, :city_town, :state_province, :country, :post_code
  has_one :user
end
