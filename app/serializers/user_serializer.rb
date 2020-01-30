class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :bio_content, :token
  #:token will be calling user.issue_token method then return the received token 
end
