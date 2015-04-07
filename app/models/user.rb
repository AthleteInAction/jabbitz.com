class User < ActiveRecord::Base

	has_secure_password

	attr_accessible :name, :email, :password, :password_confirmation, :gender, :birth_month, :birth_date, :birth_year, :phone, :address, :city, :state, :zip_code, :created_at, :updated_at

	validates_presence_of :name,:email,:birth_month,:birth_date,:birth_year,:gender,on: :create
	validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
	validates_uniqueness_of :email

end