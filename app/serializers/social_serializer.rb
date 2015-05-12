class SocialSerializer < ActiveModel::Serializer
  
  attributes :id,:user_id,:category,:profile,:uri,:created_at,:updated_at

  # def uri

  # 	if ['facebook','instagram','pinterest','twitter'].include?(object.category)
  # 		return object.profile
  # 	end

  # 	return "https://www.#{object.category}.com/#{object.profile}"

  # end

end