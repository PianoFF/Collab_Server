class MessageSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :sender, :read, :updated_at, :received_at, :sender_delete, :receiver_delete

  def sender
    sender = User.find(object.sender_id)
    return sender.slice(:id, :first_name, :last_name)
  end

  def updated_at
    object.updated_at.to_date
  end

  def received_at
    object.created_at.to_date
  end
end
