require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature "Application" do
  let(:user) { create(:user) }

  scenario "user logs in" do
    visit root_path
    click_link "Log in"
    expect(current_path).to eql(new_user_session_path)
  end

  scenario "user signs up" do
    visit new_user_session_path
    click_link "Sign up"
    expect(current_path).to eql(new_user_registration_path)

    fill_in('Email', with: 'bobby_newport@example.com')
    fill_in('Password', with: 'Vote4Leslie!!!')
    fill_in('Password confirmation', with: 'Vote4Leslie!!!')
    click_button "Sign up"
    expect(current_path).to eql(root_path)
    expect(page).to have_text("Welcome to Cookin' Meds! You have signed up successfully.")
  end

  scenario "user logs out" do
  	  login_as(user, scope: :user)
      visit root_path
      click_link "Log out"
      expect(current_path).to eql(root_path)
  end
end