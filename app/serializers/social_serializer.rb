class SocialSerializer < ActiveModel::Serializer
  
  attributes :id, :user_id, :uri, :created_at, :updated_at

end