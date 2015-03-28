require 'rails_helper'


# describe "Static pages" do

# 	describe "Home page" do

# 		it "should have the content 'iWebLab'" do
# 			visit '/static_pages/home'
# 			expect(page).to have_content('iWebLab')
# 		end
# 	end
# end

RSpec.describe "home page", :type => :request do
  it "should have the content 'iWebLab'" do
    visit "/static_pages/home"
    expect(page).to have_content("iWebLab")
  end
end