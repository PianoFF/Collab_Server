class UserSerializer < PublicUserSerializer
  attributes :token, :location, :specialty
  #  :cv, :resume, :repertoire_list
  # :received_messages,
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

  # def received_messages
  #   messages = object.received_messages
  #   ordered_messages =  messages.sort_by{ |message| message[:created_at]}.reverse
  #   ActiveModel::Serializer::CollectionSerializer.new(ordered_messages, each_serializer: MessageSerializer)
  # end
end

