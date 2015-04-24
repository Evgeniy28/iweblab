module SessionsHelper

	def sign_in(user)
		remember_token = User.new_remember_token # создаем новый токен
		cookies.permanent[:remember_token] = remember_token # помещаем зашифрованный токен в куки, метод permanent авт-ки устан-т дату истечения куки через 20 лет(20.years.from_now)
		user.update_attribute(:remember_token, User.encrypt(remember_token)) # сохраняем зашифр. токен в базе
		self.current_user = user # устанавливаем текущего пользователя равным данному
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		remember_token = User.encrypt(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end

	def sign_out
		current_user.update_attribute(:remember_token,
																	User.encrypt(User.new_remember_token))
		cookies.delete(:remember_token)
		self.current_user = nil
	end

end
