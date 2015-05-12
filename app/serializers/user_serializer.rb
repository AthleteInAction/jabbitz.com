class UserSerializer < ActiveModel::Serializer
  
  attributes(
  	:id,
  	:token_expiration,
  	:token,
  	:last_active,
  	:floating,
  	:author_id,
  	:name,
  	:email,
  	:image,
  	:remote_image_url,
  	:gender,
  	:birthdate,
  	:birth_month,
  	:birth_date,
  	:birth_year,
  	:phone,
  	:address,
  	:city,
  	:state,
  	:zip_code,
  	:created_at,
  	:updated_at
  )
  
end