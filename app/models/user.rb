class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: { maximum: 50 } #presence - наличие

	#здесь рег-ое вырю это const, обеспеч. допуст-ть адресов соотв. образцу
	#остальные будут считаться недопустимыми
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
										uniqueness: { case_sensitive: false } #игнорирует регистр
	has_secure_password
end
