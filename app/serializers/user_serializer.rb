class UserSerializer < ActiveModel::Serializer
  
  attributes :id, :name, :email, :image, :remote_image_url, :gender, :birth_month, :birth_date, :birth_year, :phone, :address, :city, :state, :zip_code, :created_at, :updated_at

  has_many :socials

end