require 'rails_helper'

RSpec.describe "UserPages", type: :request do

	subject { page }

	describe "GET users/new, signup_path" do
		before { visit signup_path }

		it { should have_selector('a', text: 'Зарегистрироваться') }
		it { should have_title('iWebLab | Регистрация') }
	end
end
