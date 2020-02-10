class UserSerializer < PublicUserSerializer
  attributes :token, :received_messages
  #:token will be calling user.issue_token method then return the received token 


  def received_messages
    messages = object.received_messages
    ordered_messages =  messages.sort_by{ |message| message[:created_at]}.reverse
    ActiveModel::Serializer::CollectionSerializer.new(ordered_messages, each_serializer: MessageSerializer)
  end

end

