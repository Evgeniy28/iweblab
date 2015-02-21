require 'spec_helper'

describe "StaticPages" do
  describe "Home pages" do
    it "should have the content 'iWebLab App' " do
      visit '/static_pages/home'
      expect(page).to have_content('iWebLab Appcdcrails')
    end
  end
end
