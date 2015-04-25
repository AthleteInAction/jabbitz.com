class User < ActiveRecord::Base

	has_secure_password

	attr_accessible :name, :email, :password, :image, :remote_image_url, :password_confirmation, :gender, :birth_month, :birth_date, :birth_year, :phone, :address, :city, :state, :zip_code, :created_at, :updated_at

	mount_uploader :image, ProfileUploader

	has_many :chimes

	validates_presence_of :name,:email
	validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
	validates_uniqueness_of :email

end