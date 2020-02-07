class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :bio_content, :token, :field, :location, :specialty, :received_messages
  #:token will be calling user.issue_token method then return the received token 

  def specialty
    if object.field == "vocalist"
      object.vocal
    else
      object.instrumental
    end
  end

  def location
    object.location
  end

  def received_messages
    ActiveModel::Serializer::CollectionSerializer.new(object.received_messages, each_serializer: MessageSerializer)
  end

end
