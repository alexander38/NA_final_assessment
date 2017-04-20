require "rails_helper"

RSpec.feature "button", :type => :feature do

  scenario "New user clicks log in button" do
    visit "/signup"
    fill_in "Email", with: "testing@gmail.com"
    expect(find_field("Email").value).to eq("testing@gmail.com")
  end

end