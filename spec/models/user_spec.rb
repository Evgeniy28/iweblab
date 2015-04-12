require 'rails_helper'

RSpec.describe User, type: :model do
	before do 
		@user = User.new(name: 'Evgeniy Azarov',
										email: 'azarov91@mail.ru',
										password: '1235qewa',
										password_confirmation: '1235qewa')
	end

	subject { @user }

	it { should respond_to(:name) } #respond_to принимает символ и возвращает true, если объект отвечает на данный метод, иначе false(проверяет в объекте наличие такой переменной)
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:authenticate) }

	it { should be_valid } #проверка что объект @user изначально валиден

	describe "when name is not present" do
		before { @user.name = " " } #присваивает невалидное имя, затем проверяет что @user невалиден
		it { should_not be_valid }
	end

	describe "when email is not present" do
		before { @user.email = " " }
		it { should_not be_valid }
	end

	describe "when name is too long" do
		before { @user.name = "a" * 51 }
		it { should_not be_valid }
	end

	describe "when email format is invalid" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo.
										 foo@bar_baz.com foo@bar+baz.com az@mail..ru]
			addresses.each do |invalid_address|
				@user.email = invalid_address
				expect(@user).not_to be_valid
			end
		end
	end

	describe "when email format is valid" do
		it "should be valid" do
			addresses = %w[user@foo.COM A_US-ER@fb.org frst.lst@foo.jp a+b@baz.cn]
			addresses.each do |valid_address|
				@user.email = valid_address
				expect(@user).to be_valid
			end
		end
	end

	describe "when email address is already taken" do
		before do
			user_with_same_email = @user.dup #создаем дубликат пользователя с теми же атрибутами
			user_with_same_email.save #сохраняем пользователя с адресом, который уже есть в базе данных
		end

		it { should_not be_valid }
	end

	describe "when email address is already taken(email.upcase)" do
		before do
			user_with_same_email = @user.dup #создаем дубликат пользователя с теми же атрибутами
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save #сохраняем пользователя с адресом, который уже есть в базе данных
		end

		it { should_not be_valid }
	end

	describe "email address with mixed case" do
		let(:mixed_case_email) { 'AzaROv91@MaIl.Ru' }

		it "should be saved as all lower-case" do
			@user.email = mixed_case_email
			@user.save
			expect(@user.reload.email).to eq mixed_case_email.downcase
		end
	end

	describe "when password is not present" do
		before do @user = User.new(name: 'Evgeniy Azarov',
															email: 'azarov91@mail.ru',
															password: '',
															password_confirmation: '')
		end
		it { should_not be_valid }
	end

	describe "when password doesn't match confirmation" do
		before { @user.password_confirmation = "mismatch" }
		it { should_not be_valid }
	end

	describe "with a password that's too short" do #тестируем на длину пароля, установив длину не меньше 6 знаков
		before { @user.password = @user.password_confirmation = "a" * 5 }
		it { should be_invalid }
	end

	describe "return value of authenticate method" do
		before { @user.save } 
		let(:found_user) { User.find_by(email: @user.email) } #let создает локальную переменную внутри теста

		describe "with valid password" do
			it { should eq found_user.authenticate(@user.password) } #'равенство' eq служит для проверки эквивалентности объектов
		end

		describe "with invalid password" do
			let(:user_for_invalid_password) { found_user.authenticate('invalid') }

			it { should_not eq user_for_invalid_password }
			specify { expect(user_for_invalid_password).to be_falsey } #метод specify синоним для it, используется когда it звучит ненатурально
		end
	end

end
