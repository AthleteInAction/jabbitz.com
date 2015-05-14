class UserSerializer < ActiveModel::Serializer
  
  attributes(
  	:id,
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
    :age,
  	:phone,
  	:address,
  	:city,
  	:state,
  	:zip_code,
    :access,
  	:created_at,
  	:updated_at
  )

  def age

    if object.birthdate.present?
      bd = object.birthdate.to_s
      a = Date.parse bd
      t = Time.now
      b = Date.parse("#{t.year}-#{t.month}-#{t.day}")
      ((b-a).to_f/365).floor
    else
      nil
    end

  end
  
end