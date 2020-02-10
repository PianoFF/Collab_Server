class UserSerializer < PublicUserSerializer
  attributes :token, :received_messages
  #:token will be calling user.issue_token method then return the received token 


  def received_messages
    ActiveModel::Serializer::CollectionSerializer.new(object.received_messages, each_serializer: MessageSerializer)
  end

end

