class MessageSerializer < ActiveModel::Serializer
  attributes :title, :content, :sender

  def sender
    sender = User.find(object.sender_id)
    return sender.slice(:id, :first_name, :last_name)
  end
end
