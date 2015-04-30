require 'rails_helper'

RSpec.describe "UserPages", type: :request do

	subject { page }

	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_content(user.name) }
		it { should have_title(user.name) }
	end

	describe "GET users/new, signup_path" do
		before { visit signup_path }

		it { should have_content('Email') }
		it { should have_title('Регистрация') }
	end

	describe "signup page" do
		before { visit signup_path }
		let(:submit) { 'Зарегистрироваться' }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end

			describe "after submission" do
				before { click_button submit }

				it { should have_title('Регистрация') }
				it { should have_content('error') }
			end
		end

		describe "with valid information" do
			before do
				fill_in "Логин",         with: "Evgeniy28"
				fill_in "Email",        with: "azarov91@mail.ru"
				fill_in "Пароль",     with: "foobar"
				fill_in "Подтвердите пароль", with: "foobar"
			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end

			describe "after saving the user" do
				before { click_button submit }
				let(:user) { User.find_by(name: 'Evgeniy28') }

				it { should have_link('Выйти') }
				it { should have_title(user.name) }
				it { should have_selector('div.alert.alert-success', text: 'Добро') }
			end
		end
	end

	describe "edit" do
		let(:user) { FactoryGirl.create(:user) }
		before do
			visit signin_path
			fill_in "Email", with: user.email.upcase
			fill_in "Пароль", with: user.password
			click_button "Войти"
			visit edit_user_path(user)
		end

		describe "page" do
			it { should have_content("Персональные настройки") }
			it { should have_title("Редактирование пользователя") }
		end

		describe "with invalid information" do
			before { click_button "Сохранить изменения" }

			it { should have_content('error') }
		end

		describe "with valid information" do
			let(:new_name) { "New Name" }
			let(:new_email) { "new@example.com" }
			before do
				fill_in "Логин", with: new_name
				fill_in "Email", with: new_email
				fill_in "Пароль", with: user.password
				fill_in "Подтвердите пароль", with: user.password
				click_button "Сохранить изменения"
			end

			it { should have_title(new_name) }
			it { should have_selector('div.alert.alert-success') }
			it { should have_link('Выйти', href: signout_path) }
			specify { expect(user.reload.name).to eq new_name }
			specify { expect(user.reload.email).to eq new_email }
		end
	end

end
