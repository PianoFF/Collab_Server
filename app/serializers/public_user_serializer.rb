  class PublicUserSerializer<ActiveModel::Serializer 
    attributes :id,
     :first_name, 
     :last_name, 
     :email, 
     :bio_content, 
     :field, 
    #  :location, 
    #  :specialty,
     :created_at

  #  def specialty
  #   if object.field == "vocalist"
  #     object.vocal
  #   else
  #     object.instrumental
  #   end
  # end

  # def location
  #   object.location
  # end

  end