class User < ActiveRecord::Base

	before_create :generate_token

	has_secure_password

	attr_accessible :birthdate, :token_expiration, :token, :last_active, :promo_code, :floating, :author_id, :name, :email, :password, :image, :remote_image_url, :password_confirmation, :gender, :birth_month, :birth_date, :birth_year, :phone, :address, :city, :state, :zip_code, :created_at, :updated_at

	mount_uploader :image, ProfileUploader

	validates_presence_of :name
	validates_presence_of :email,unless: :floating?
	validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/,if: (:email? || !:floating?)
	validates :password, presence: true, length: {minimum: 6, maximum: 20}, on: :create,unless: :floating?
	validates :password, length: {minimum: 6, maximum: 20}, on: :update,if: :password
	validates_uniqueness_of :email,unless: :floating?

	protected
	def generate_token

		self.token = SecureRandom.urlsafe_base64

	end
	def password?

		self.password.present?

	end

end