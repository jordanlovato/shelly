require 'bcrypt'

class ShellyUser
  include Mongoid::Document
	include Mongoid::Timestamps
	include BCrypt

	field :username, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
	field :encrypted_password, type: String
  field :description, type: String
  field :activated, type: Mongoid::Boolean

	attr_accessor :password, :username, :first_name, :last_name, :email, :description

	before_save :encrypt_password
	after_save :clear_password

	EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

	
	validates_presence_of :username
	validates_uniqueness_of :username
	validates_length_of :username, minimum: 3, maximum: 20
 	
  validates_presence_of :email
	validates_uniqueness_of :email
	validates_format_of :email, with: EMAIL_REGEX

	validates_confirmation_of :password
	validates_presence_of :password
	validates_length_of :password, minimum: 6, maximum: 20, on: :create

	validates_presence_of :password_confirmation

	validates_presence_of :first_name
	validates_length_of :first_name, minimum: 1, maximum: 50
  
	validates_presence_of :last_name
	validates_length_of :last_name, minimum: 1, maximum: 50

	private		
		attr_accessor :salt		

		def encrypt_password
			if password.present?
				self.salt = BCrypt::Engine.generate_salt
				self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
			end
		end

		def clear_password
			self.password = nil
		end
end
