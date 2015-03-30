require 'rails_helper'

RSpec.describe "Static pages", :type => :request do

	subject { page }

	describe "home page" do
		before { visit root_path }

		it { should have_content('website') }
		it { should have_title('iWebLab | Лаборатория веб-разработки') }
	end

	describe "courses page" do
		before { visit courses_path }

		it { should have_content('Курсы') }
		it { should have_title('Курсы') }
	end

	it "should have the right links on the layout" do
		visit root_path

		click_link "Курсы"
		expect(page).to have_title('Курсы')

		click_link "Главная"
		expect(page).to have_title('Лаборатория веб-разработки')
	end
end


